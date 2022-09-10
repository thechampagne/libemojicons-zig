// Copyright (c) 2022 XXIV
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
const std = @import("std");

extern "C" fn emojicons_emoji_formatter(str: [*c]const u8) [*c]u8;

extern "C" fn emojicons_free(ptr: [*c] u8) void;

pub const Error = error{
    Null
};

/// Substituting emoji codes for emoji.
/// 
/// Example:
/// * *
/// const std = @import("std");
/// const lib = @import("emojicons");
/// 
/// pub fn main() !void {
///     const data = try lib.emojiFormatter("Hello World :smile:");
///     defer lib.free(data);
///     std.debug.print("{s}\n", .{data});
/// }
/// * *
/// 
/// @param str
/// @return Slice of bytes
pub fn emojiFormatter(str: []const u8) Error![]u8 {
    const res = emojicons_emoji_formatter(str.ptr);
    if (res == null) {
        return Error.Null;
    }
    return std.mem.span(res);
}

/// function to free the memory after using emojicons functions
///
/// @param slice string returned from emojicons functions
pub fn free(slice: []u8) void {
    emojicons_free(slice.ptr);
}

test {
    const data = try emojiFormatter("Hello World :smile:");
    defer free(data);
    try std.testing.expect(std.mem.eql(u8, "Hello World 😄", data));
}