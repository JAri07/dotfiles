#!/bin/bash
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesAUR "${packagesAUR[@]}"
_installPackagesNPM "${packagesNPM[@]}"

echo "SPACE = select/unselect a package to install. RETURN = confirm. No selection = SKIP"
selectedOptionalPacman=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "${optionalPackagesPacman[@]}")
selectedLatexPackages=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "${latexPacman[@]}")
optionalPacman=("${selectedOptionalPacman// / }")
latexPackages=("${selectedLatexPackages// / }")

if [ ${#optionalPacman[@]} -ne 0 ]; then
  _installPackagesPacman "${optionalPacman[@]}"
fi
if [ ${#latexPackages[@]} -ne 0 ]; then
  _installPackagesPacman "${latexPackages[@]}"
fi
