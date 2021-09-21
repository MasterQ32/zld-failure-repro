const std = @import("std");

pub fn build(b: *std.build.Builder) !void {
    const zip_add = b.addExecutable("zip_add", "tools/zip_add.zig");
    zip_add.addCSourceFile("vendor/kuba-zip/zip.c", &[_][]const u8{
        "-std=c99",
        "-fno-sanitize=undefined",
    });
    zip_add.addIncludeDir("vendor/kuba-zip");
    zip_add.linkLibC();
    zip_add.install();
}
