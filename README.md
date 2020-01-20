# Walking Git tag

This action updates or creates a walking Git tag. This means that the action, when triggered again,
updates the previous Git tag to the commit of the current build.

## Usage

```
- name: Set Git tag
  uses: weareyipyip/walking-tag-action@v1
  with:
    TAG_NAME: current-production
    TAG_MESSAGE: The current production release is based on this commit
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```