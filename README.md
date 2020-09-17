# Image Fetcher Coding Challenge

![Run Tests](https://github.com/patrickdet/client-coding-challenge/workflows/Run%20Tests/badge.svg)

The image fetcher takes a file path as a cli input. It will read the file at the
input path. The required file structure is one of newline separated urls.

The image fetcher will attempt to fetch each of the image urls and store the
images on disk.

## Assumptions

TL;DR
* Input: has to be a well-formed file of newline separated URLs
* Storage: Images stored in a directory under their original names
* Errors: Accumulated, isolated and logged after the program's run

The biggest assumption is that the input file exists and contains wellformed
URLs. I have made this assumption because "we" control the input in this case
and it is not input from an unknown user. The error handling for this can
be improved. Additionally the cli could be extended to allow for different
storage targets or different error strategies. The default error strategy is to
collect errors and log them after the program has finished. This is a best
effort strategy which will attempt to process as many images as possible. Errors
are isolated on a "per input line" basis, meaning just because there was an
error in one fetch-and-store attempt it does not mean that all other images are
affected. This is obviously an assumption. Another strategy might for example
want to remove all fetched files if an error occurs.
Another assumption is that files are stored under their original filename. For
example a file with a URL of http://example.com/some/path/image.jpg will be
stored under /tmp/output-directory/image.jpg. This could mean that multiple
files of the same name overwrite each other. A more sophisticated strategy could
be devised. One possible way would be to hash each image's content and use this
hash as the filename. This leaves us with the problem of matching the original
URL with the stored filename.
The fetching and storing is currently completely sequential. Since this is a
naturally concurrent problem we could easily make the FetchAndStorePipe
concurrent.

## Example usage

`ruby cli.rb test-images`

An output directory can be specified as follows:

`ruby cli.rb test-images /tmp/my-output-directory`


## Tests

In order to run the test suite run:

`bundle exec rake test`
