{ ... }:

{
  enable = true;
  arguments = [
    "--max-columns=150"
    "--max-columns-preview"
    "--type-add" "web:*.{html,css,js}*"
    "--hidden"
    "--glob" "!.git/*"
    "--colors=line:none"
    "--colors=line:style:bold"
    "--smart-case"
  ];
}
