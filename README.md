# libemojicons-zig

[![](https://img.shields.io/github/v/tag/thechampagne/libemojicons-zig?label=version)](https://github.com/thechampagne/libemojicons-zig/releases/latest) [![](https://img.shields.io/github/license/thechampagne/libemojicons-zig)](https://github.com/thechampagne/libemojicons-zig/blob/main/LICENSE)

Zig binding for **libemojicons**.

### API

```zig
fn emojiFormatter(str: []const u8) Error![]u8;

fn free(slice: []u8) void;
```

### References
 - [libemojicons](https://github.com/thechampagne/libemojicons)

### License

This repo is released under the [MIT](https://github.com/thechampagne/libemojicons-zig/blob/main/LICENSE).