# CSV Delimiter

Microsft Excel uses `;` as delimiter for CSV files, even the name implies that the delimiter should be `,`.

The `get_csv_delimiter` function inspects the CSV file specified by `$filename` to determine the delimiter used in the file.

To do so, it checks the delimiter of the first line of the file using `head -n 1`.
If the first line of the file contains a `;` (MS Excel format), `get_csv_delimiter` returns `;`. If `get_csv_delimiter` finds a `,` (proper CSV file), it returns `,`.
If no `;` or `,` is found, it fails with `exit 1`.

> If the "header" contains both `;` and `,`, as `;` is checked first, `get_csv_delimiter` returns `;`.

## Usage

```console
delimiter=$(get_csv_delimiter "$filename")
```
