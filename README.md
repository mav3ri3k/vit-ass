This is a template for my College Digital Assignemts
- `lib.typ` is the main package
- `ass.typ` is a sample assignment

Heavily inspired from Meta's Paper Design: [Sample](https://ai.meta.com/research/publications/large-concept-models-language-modeling-in-a-sentence-representation-space/)

Helper script for Nushell
```nu
# Copy vit-ass typst template to given path
#
# Copied from: ~/college/vit-ass
# Files copied: ass.typ lib.typ title.png
export def main [
name: string = '.' # Path to directory
] {
    let pth = (pwd | path join $name)
    mkdir $pth
    cd $pth
    cp ~/college/vit-ass/lib.typ ~/college/vit-ass/q1.png ~/college/vit-ass/title.png ~/college/vit-ass/ass.typ $pth
}

# Compile ass.typ in current directory
export def compile [] {
    let pth = (pwd | path join 'ass.typ')
    typst compile $pth
}

# Watch ass.typ in current directory
export def watch [] {
    let pth = (pwd | path join 'ass.typ')
    typst watch $pth
}
```
Add it to `$nu.config-path` as:
```nu
# Custom Command: vit-ass
use /Users/apurva/.config/nu/vit-ass/vit-ass.nu
```
