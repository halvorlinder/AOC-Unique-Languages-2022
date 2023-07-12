import std/sugar
import std/strutils

let lines = collect(newSeq):
  for line in lines "../Data/5.txt": line

const LANES = 9
const INITIAL_ROWS = 8
const UNUSED_ROWS = 2

var crates : array[LANES, seq[char]]

for lane in 0..LANES-1:
    crates[lane] = newSeq[char](0)
    let offset = 4*lane + 1
    for row in countdown(INITIAL_ROWS-1,0):
        let crate = lines[row][offset];
        if isAlphaAscii(crate):
            crates[lane].add(lines[row][offset])

for line in lines[INITIAL_ROWS+UNUSED_ROWS..lines.len-1]:
    let tokens = split(line, " ")
    let count = parseInt(tokens[1])
    let source = parseInt(tokens[3])-1
    let target = parseInt(tokens[5])-1
    crates[target].add(crates[source][crates[source].len-count..^1])
    for i in crates[source].len-count..crates[source].len-1:
        crates[source].delete(i)

for lane in crates: 
    stdout.write lane[^1]
echo ""
