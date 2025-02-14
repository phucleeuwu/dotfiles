"use strict";var a=Object.defineProperty;var p=Object.getOwnPropertyDescriptor;var f=Object.getOwnPropertyNames;var d=Object.prototype.hasOwnProperty;var u=(t,e)=>{for(var n in e)a(t,n,{get:e[n],enumerable:!0})},m=(t,e,n,o)=>{if(e&&typeof e=="object"||typeof e=="function")for(let s of f(e))!d.call(t,s)&&s!==n&&a(t,s,{get:()=>e[s],enumerable:!(o=p(e,s))||o.enumerable});return t};var h=t=>m(a({},"__esModule",{value:!0}),t);var w={};u(w,{default:()=>g});module.exports=h(w);var r=require("@raycast/api");var c=require("node:child_process");async function l(t){if(process.platform!=="darwin")throw new Error("macOS only");let e=process.env.LC_ALL;delete process.env.LC_ALL;let{stdout:n}=(0,c.spawnSync)("osascript",["-e",t]);return process.env.LC_ALL=e,n.toString()}var g=async t=>{let e=(0,r.getPreferenceValues)().extensions?.trim().split(","),n=t.arguments.filename,o=n?.split(".").pop()||"",s=`
          if application "Finder" is not running then
  	        return "Finder not running"
          end if

          tell application "Finder"
            set pathList to (quoted form of POSIX path of (folder of the front window as alias))

            if exists (POSIX path of (folder of the front window as alias)) & "${n}" as POSIX file then
		          return "Already exists"
	          end if
          end tell

          set command to "touch " & pathList & "${n}"
          do shell script command
      `;e!==void 0&&(e.includes("*")||e.includes(o))&&(s+=`
      set command to "open " & pathList & "${n}"
      do shell script command
    `);try{let i=(await l(s)).trim();i=="Already exists"||i=="Finder not running"?await(0,r.showToast)(r.Toast.Style.Failure,"File creation error:",i):await(0,r.showToast)(r.Toast.Style.Success,"Done",i)}catch{await(0,r.showToast)(r.Toast.Style.Failure,"Something went wrong")}};
