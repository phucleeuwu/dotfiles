"use strict";var s=Object.defineProperty;var p=Object.getOwnPropertyDescriptor;var l=Object.getOwnPropertyNames;var u=Object.prototype.hasOwnProperty;var m=(t,r)=>{for(var o in r)s(t,o,{get:r[o],enumerable:!0})},d=(t,r,o,i)=>{if(r&&typeof r=="object"||typeof r=="function")for(let n of l(r))!u.call(t,n)&&n!==o&&s(t,n,{get:()=>r[n],enumerable:!(i=p(r,n))||i.enumerable});return t};var g=t=>d(s({},"__esModule",{value:!0}),t);var y={};m(y,{default:()=>f});module.exports=g(y);var e=require("@raycast/api");var a=require("node:child_process");async function c(t){if(process.platform!=="darwin")throw new Error("macOS only");let r=process.env.LC_ALL;delete process.env.LC_ALL;let{stdout:o}=(0,a.spawnSync)("osascript",["-e",t]);return process.env.LC_ALL=r,o.toString()}var f=async t=>{let r=t.arguments.thing,o=t.arguments.application,i=`
        set command to "open " & "${r}"
        try
          do shell script command
        on error err
          return err
        end try
    `;o&&(i=`
            set command to "open -a " & "${o} " & "${r}"
            try
              do shell script command
            on error err
              return err
            end try
        `);try{let n=(await c(i)).trim();n.includes("application")?await(0,e.showToast)(e.Toast.Style.Failure,"Error opening file:","Application not found"):n.includes("file")?await(0,e.showToast)(e.Toast.Style.Failure,"Error opening file:","File not found"):await(0,e.showToast)(e.Toast.Style.Success,"Done",n)}catch{await(0,e.showToast)(e.Toast.Style.Failure,"Something went wrong")}};
