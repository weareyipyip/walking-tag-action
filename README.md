# Walking Git tag

This action updates or creates a walking Git tag.

## Usage

```
- name: Set Git tag
  uses: weareyipyip/walking-tag-action
  with:
    TAG_NAME: current-production
    TAG_MESSAGE: The current production release is based on this commit
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```