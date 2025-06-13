CLEAN_FILES=$(jq -r '.[]' .rubocop/clean_files.json)

if [[ -n "$CLEAN_FILES" ]]; then
  echo "Removing clean files from .rubocop/exclusions.yml..."

  # Escape special characters in filenames for awk regex
  FILES_PATTERN=$(echo "$CLEAN_FILES" | sed 's/[.[\*^$]/\\&/g' | tr '\n' '|')
  FILES_PATTERN="${FILES_PATTERN%|}"  # Remove trailing pipe '|'

  # Use awk to process exclusions.yml safely
  awk -v pat="$FILES_PATTERN" '
    /Exclude:/ {inside_exclude=1}
    /^\s*$/ {inside_exclude=0}
    inside_exclude && $0 ~ pat {next}
    {print}
  ' .rubocop/exclusions.yml > .rubocop/exclusions.yml.tmp

  mv .rubocop/exclusions.yml.tmp .rubocop/exclusions.yml

  git config --global user.name "${{ github.actor }}"
  git config --global user.email "${{ github.actor }}@users.noreply.github.com"
  git add .rubocop/exclusions.yml
  git commit -m "ci: Removing fully lintable files from exclusion list [skip ci]"
  git push
fi
