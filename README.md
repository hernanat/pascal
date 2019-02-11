# pascal


## About

pascal is a small CLI tool for printing out the first `n` rows of [Pascal's Triangle](https://en.wikipedia.org/wiki/Pascal%27s_triangle).


## Usage

There are several options you can pass to `pascal`: 

```console
~ % pascal -h
Usage: pascal [options]
    -n, --num_rows=NUM_ROWS          Number of rows in triangle
    -s, --num_space=NUM_SPACE        Number of spaces between adjacent cells
    -p, --padding=PADDING            Left-padding to help center triangle
    -d, --diamond                    Print as a diamond
    -h, --help                       Print out usage information
```

## Examples


### Basic

Specify the number of rows using the `-n` option:

```console
~ % pascal -n5
         1
        1 1
       1 2 1
      1 3 3 1
     1 4 6 4 1
```

### Adding spacing between cells

You can use the `-s` option to specify the number of spaces between cells:

```console
~ % pascal -n5 -s3
         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
```

### Adding extra padding

Depending how many rows you are printing, you may encounter some padding / centering issues. For example:

```console
~ % pascal -n10 -s3
         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
1   5   10   10   5   1
1   6   15   20   15   6   1
1   7   21   35   35   21   7   1
1   8   28   56   70   56   28   8   1
1   9   36   84   126   126   84   36   9   1
```

This is clearly not desirable output. You can fix it using the `-p` option as follows:

```console
~ % pascal -n10 -s3 -p45
                      1
                    1   1
                  1   2   1
                1   3   3   1
              1   4   6   4   1
           1   5   10   10   5   1
        1   6   15   20   15   6   1
      1   7   21   35   35   21   7   1
   1   8   28   56   70   56   28   8   1
1   9   36   84   126   126   84   36   9   1
```

### Printing as a diamond

You may desire to reflect Pascal's triangle across the final row. You can do it using the `-d` option:

```console
~ % pascal -n5  -d
         1
        1 1
       1 2 1
      1 3 3 1
     1 4 6 4 1
      1 3 3 1
       1 2 1
        1 1
         1
```

## Questions / comments / concerns


Shoot me an email at: <ant@antfeedr.com>.

## Contributing

Feel free to contribue to this project. Fork the repo and open up a PR with your changes!
