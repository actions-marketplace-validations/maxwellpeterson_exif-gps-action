# EXIF GPS Action

This action removes EXIF GPS tags from media files in the repository. All media files containing EXIF GPS tags will be overwritten with updated versions that do not contain these tags. No new files will be created.

The original use case for this action was scrubbing images of potentially sensitive location data before publishing them on a personal website. With static site generators like [Hugo](https://gohugo.io/) it's common for all images to be checked into the source repository, and running this action as a pre-build step prevents this location data from being embedded in the public website.

Of course, if the source repository is also public, then by the time this action runs it's already a bit late. At the very least, it adds some level of privacy through obscurity. If you're really concerned about location data making it into git history, a pre-commit hook is probably a better tool for the job. That being said, if someone really wants to figure out where you're located, they probably don't need to comb through EXIF tags to do so, [unless you're an international fugitive](https://en.wikipedia.org/wiki/Exif#Privacy_and_security).

This action uses the excellent [`exiftool`](https://exiftool.org/) for modifying files, and all it does is run `exiftool -r -gps:all= -overwrite_original .` in the root of the repository. That's it! Creating an action for this makes it ridiculously easy to add to any project, since `exiftool` is not provided by the default action runner environments.

## Inputs

This action takes no inputs.

## Outputs

This action produces no outputs.

## Example Usage

```yaml
uses: maxwellpeterson/exif-gps-action@v1
```
