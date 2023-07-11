const std = @import("std");

pub fn main() !void {
    var file = try std.fs.cwd().openFile("../../Data/2.txt", .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buf: [1024]u8 = undefined;

    var total : u64 = 0;

    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        var opponent = line[0];
        var me = line[2];

        if (opponent == 'A' and me == 'X')
            total += 3;
        if (opponent == 'A' and me == 'Y')
            total += 4;
        if (opponent == 'A' and me == 'Z')
            total += 8;
        if (opponent == 'B' and me == 'X')
            total += 1;
        if (opponent == 'B' and me == 'Y')
            total += 5;
        if (opponent == 'B' and me == 'Z')
            total += 9;
        if (opponent == 'C' and me == 'X')
            total += 2;
        if (opponent == 'C' and me == 'Y')
            total += 6;
        if (opponent == 'C' and me == 'Z')
            total += 7;
    }
    std.debug.print("{d}\n", .{total});
}
