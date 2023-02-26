#!/bin/bash
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesAUR "${packagesAUR[@]}"

echo "SPACE = select/unselect a package to install. RETURN = confirm. No selection = CANCEL"
selectedOptionalPacman=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "${optionalPackagesPacman[@]}")
selectedOptionalAUR=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "${optionalPackagesAUR[@]}")
selectedLatexPackages=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "${latexPacman[@]}")
optionalPacman=(${selectedOptionalPacman// / })
latexPackages=(${selectedLatexPackages// / })
optionalAUR=(${selectedOptionalAUR// / })

if [ ${#optionalPacman[@]} -ne 0 ]; then
  _installPackagesPacman "${optionalPacman[@]}"
fi
if [ ${#optionalAUR[@]} -ne 0 ]; then
  _installPackagesAUR "${optionalAUR[@]}"
fi
if [ ${#latexPackages[@]} -ne 0 ]; then
  _installPackagesPacman "${latexPackages[@]}"
fi
