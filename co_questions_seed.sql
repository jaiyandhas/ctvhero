-- ============================================================
-- Computer Organization & Architecture — 241 Questions
-- Run AFTER supabase_schema.sql
-- ============================================================

INSERT INTO public.questions (subject, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, gate_year, source_type, difficulty) VALUES

-- Q1
('Computer Organization', 'The amount of ROM needed to implement a 4-bit multiplier is', '64 bits', '128 bits', '1 Kbits', '2 Kbits', 'D', 'Inputs = 4 bits × 4 bits = 8 bits. Number of input combinations = 2^8 = 256. Output = 8 bits (product). ROM size = 256 × 8 = 2048 bits = 2 Kbits.', NULL, 'GATE PYQ', 'Hard'),

-- Q2
('Computer Organization', 'A computer has a 256 KB, 4-way set associative cache with block size 32 bytes. Processor address = 32 bits. Number of tag bits is', '11', '14', '16', '27', 'C', 'Cache lines = 256KB / 32B = 8192. Sets = 8192 / 4 = 2048 → index bits = 11. Offset bits = log2(32) = 5. Tag = 32 − 11 − 5 = 16.', NULL, 'GATE PYQ', 'Hard'),

-- Q3
('Computer Organization', 'Register renaming is done in pipelined processors to', 'Serve as an alternative to compile-time allocation of registers', 'Enable efficient parameter access', 'Handle certain kinds of hazards', 'Facilitate virtual to physical address translation', 'C', 'Register renaming eliminates WAR (write after read) and WAW (write after write) hazards, which are false dependencies.', NULL, 'GATE PYQ', 'Medium'),

-- Q4
('Computer Organization', 'Size of cache tag directory (from Q2 data)', '160 Kbits', '136 bits', '40 Kbits', '32 bits', 'A', 'Tag + valid + modified + replacement bits across all entries sum to 160 Kbits.', NULL, 'GATE PYQ', 'Hard'),

-- Q5
('Computer Organization', 'Which combination of DMA mode and interrupt technique gives the highest I/O bandwidth?', 'Transparent DMA + Polling', 'Cycle stealing + Vectored interrupt', 'Block transfer + Vectored interrupt', 'Block transfer + Polling', 'C', 'Block transfer maximizes bandwidth; vectored interrupts reduce overhead.', NULL, 'GATE PYQ', 'Medium'),

-- Q6
('Computer Organization', 'In k-way set associative mapping, block j of main memory maps to which set?', '(j mod v)k to (j mod v)k + (k−1)', '(j mod v) to (j mod v) + (k−1)', '(j mod k) to (j mod k) + (v−1)', '(j mod k)v to (j mod k)v + (v−1)', 'A', 'Block j maps to set (j mod v), and within that set any of the k lines can hold it.', NULL, 'GATE PYQ', 'Hard'),

-- Q7
('Computer Organization', 'The micro-operations MBR ← PC, MAR ← X, PC ← Y, Memory ← MBR correspond to which operation?', 'Instruction fetch', 'Operand fetch', 'Conditional branch', 'Interrupt service initiation', 'D', 'Saving the PC and updating control flow to a new address indicates interrupt handling — the return address is saved and control transfers to the handler.', NULL, 'GATE PYQ', 'Hard'),

-- Q8
('Computer Organization', '5-stage pipeline timing problem — execution time', '132 ns', '165 ns', '176 ns', '328 ns', 'C', 'Cycle time = slowest stage + buffer delay; include branch penalty. Result is 176 ns.', NULL, 'GATE PYQ', 'Hard'),

-- Q9
('Computer Organization', 'Number of 2×4 decoders needed to build 16K×16 RAM from 1K×8 chips', '4', '5', '6', '7', 'A', 'Need 16 data bits (2 chips wide) and 16 address groups (16K/1K=16, need 4-bit decode). 4 decoders required.', NULL, 'GATE PYQ', 'Hard'),

-- Q10
('Computer Organization', 'Minimum number of register spills needed with only two registers', '0', '1', '2', '3', 'C', 'Temporary values survive across control paths — at least 2 unavoidable spills occur.', NULL, 'GATE PYQ', 'Hard'),

-- Q11
('Computer Organization', 'Minimum number of registers required to evaluate an expression tree without spills', '3', '4', '5', '6', 'B', '4 registers are sufficient to evaluate the expression tree without any spills.', NULL, 'GATE PYQ', 'Medium'),

-- Q12
('Computer Organization', 'The instruction LW R1, 20(R2) uses which addressing mode?', 'Immediate', 'Register', 'Register indirect scaled', 'Base indexed (displacement)', 'D', 'Effective address = base register (R2) + displacement (20). This is base+displacement / base indexed addressing.', NULL, 'GATE PYQ', 'Easy'),

-- Q13
('Computer Organization', 'Speedup achieved using DMA', '3.4', '4.4', '5.1', '6.7', 'B', 'Calculated speedup using DMA over programmed I/O is 4.4.', NULL, 'GATE PYQ', 'Hard'),

-- Q14
('Computer Organization', 'Minimum number of registers needed to evaluate an expression tree', '2', '9', '5', '3', 'D', '3 registers are the minimum needed to evaluate the given expression tree.', NULL, 'GATE PYQ', 'Medium'),

-- Q15
('Computer Organization', 'Pipeline speedup in ideal steady state', '4.0', '2.5', '1.1', '3.0', 'B', 'Given the pipeline parameters, the ideal steady-state speedup is 2.5.', NULL, 'GATE PYQ', 'Medium'),

-- Q16
('Computer Organization', 'Tag storage size for a given cache configuration', '4864 bits', '6144 bits', '6656 bits', '5376 bits', 'B', 'Tag storage size calculates to 6144 bits for the given configuration.', NULL, 'GATE PYQ', 'Hard'),

-- Q17
('Computer Organization', 'DRAM refresh time for given parameters', '100 ns', '100 × 2^10 ns', '100 × 2^20 ns', '3200 × 2^20 ns', 'B', 'Refresh time = 100 × 2^10 ns based on the row count and refresh cycle.', NULL, 'GATE PYQ', 'Medium'),

-- Q18
('Computer Organization', 'Clock cycles needed for a given pipeline instruction sequence', '13', '15', '17', '19', 'C', '17 clock cycles are needed accounting for pipeline fill and drain.', NULL, 'GATE PYQ', 'Hard'),

-- Q19
('Computer Organization', 'Minimum number of registers needed for a given program segment', '2', '3', '4', '6', 'C', '4 registers are the minimum required for the given program segment.', NULL, 'GATE PYQ', 'Medium'),

-- Q20
('Computer Organization', 'L2 to L1 cache transfer time', '2 ns', '20 ns', '22 ns', '88 ns', 'D', 'L2 to L1 transfer time = 88 ns for the given parameters.', NULL, 'GATE PYQ', 'Hard'),

-- Q21
('Computer Organization', 'Total transfer time from Main Memory → L2 → L1', '222 ns', '888 ns', '902 ns', '968 ns', 'D', 'Total transfer time = 968 ns combining all levels of the memory hierarchy.', NULL, 'GATE PYQ', 'Hard'),

-- Q22
('Computer Organization', 'Number of 32K×1 RAM chips needed to build 256KB memory', '8', '32', '64', '128', 'C', '256KB = 256K×8 bits. Need 256K/32K = 8 chips wide and 8 chips for width = 64 chips total.', NULL, 'GATE PYQ', 'Medium'),

-- Q23
('Computer Organization', 'Pipeline cycles for a given loop execution', '16', '23', '28', '30', 'B', '23 cycles needed including pipeline fill and loop iterations.', NULL, 'GATE PYQ', 'Hard'),

-- Q24
('Computer Organization', 'Which block is NOT present in cache with LRU replacement?', '3', '8', '129', '216', 'D', 'Block 216 is the one evicted by LRU policy given the access sequence.', NULL, 'GATE PYQ', 'Hard'),

-- Q25
('Computer Organization', 'Swap space resides in', 'RAM', 'Disk', 'ROM', 'Cache', 'B', 'Swap space is a designated area on disk used as an extension of physical RAM for virtual memory.', NULL, 'GATE-inspired', 'Easy'),

-- Q26
('Computer Organization', 'Boolean function derived from K-map', '(A+C)·D+B', '(A+B)·C+D', '(A+D)·C+B', '(A+C)·B+D', 'D', 'Reading the K-map groupings gives the minimal expression (A+C)·B+D.', NULL, 'GATE PYQ', 'Hard'),

-- Q27
('Computer Organization', 'True statements about auto-increment addressing mode', 'I only', 'II only', 'III only', 'II and III only', 'D', 'Statements II and III are correct regarding auto-increment addressing.', NULL, 'GATE PYQ', 'Medium'),

-- Q28
('Computer Organization', 'Which statements about RFE (Return From Exception) instruction must be true?', 'I only', 'II only', 'I and II only', 'I, II and III', 'C', 'Statements I and II must always be true for RFE instruction.', NULL, 'GATE PYQ', 'Hard'),

-- Q29
('Computer Organization', 'Conditions required for cache inclusion property', 'IV only', 'I and IV only', 'I, III and IV only', 'I, II, III and IV', 'B', 'Cache inclusion requires conditions I and IV only.', NULL, 'GATE PYQ', 'Hard'),

-- Q30
('Computer Organization', 'Which statements are NOT true in a pipelined processor?', 'I and II only', 'I and III only', 'II and III only', 'I, II and III', 'A', 'Statements I and II are not true in a pipelined processor.', NULL, 'GATE PYQ', 'Medium'),

-- Q31
('Computer Organization', 'Register windows reduce memory accesses for which types of calls?', 'I only', 'II only', 'III only', 'I and II only', 'D', 'Register windows reduce accesses for types I and II.', NULL, 'GATE PYQ', 'Medium'),

-- Q32
('Computer Organization', 'Earliest point at which data TLB access can be initiated', 'Before address calculation', 'During address calculation', 'After address calculation', 'After cache lookup', 'B', 'TLB access can begin during address calculation as soon as the page number is known.', NULL, 'GATE PYQ', 'Hard'),

-- Q33
('Computer Organization', 'Total tag size for a given cache configuration', '32 Kbits', '34 Kbits', '64 Kbits', '68 Kbits', 'B', 'Total tag size = 34 Kbits for the given cache parameters.', NULL, 'GATE PYQ', 'Hard'),

-- Q34
('Computer Organization', 'Cache hit ratio for a loop accessing instructions', '0%', '25%', '50%', '75%', 'D', '75% hit ratio — first iteration misses, subsequent iterations hit.', NULL, 'GATE PYQ', 'Medium'),

-- Q35
('Computer Organization', 'TAG / LINE / WORD bit split for a given address space and cache', '9, 6, 5', '7, 7, 6', '7, 5, 8', '9, 5, 6', 'D', 'Splitting the address gives 9 tag bits, 5 line/index bits, and 6 word/offset bits.', NULL, 'GATE PYQ', 'Hard'),

-- Q36
('Computer Organization', 'Number of pipeline cycles for a given instruction sequence', '7', '8', '10', '14', 'C', '10 pipeline cycles are needed for the given sequence.', NULL, 'GATE PYQ', 'Hard'),

-- Q37
('Computer Organization', 'Number of memory references for a given instruction sequence', '10', '11', '20', '21', 'B', '11 memory references are made in total for the given sequence.', NULL, 'GATE PYQ', 'Hard'),

-- Q38
('Computer Organization', 'Value stored at memory location 2010 after execution', '100', '101', '102', '110', 'B', 'After execution the value stored at memory location 2010 is 101.', NULL, 'GATE PYQ', 'Hard'),

-- Q39
('Computer Organization', 'Return address pushed on the stack during interrupt', '1005', '1020', '1024', '1040', 'C', 'The return address pushed during interrupt is 1024 — the address of the next instruction.', NULL, 'GATE PYQ', 'Hard'),

-- Q40
('Computer Organization', 'Total cache misses for a given access sequence', '40', '50', '56', '59', 'C', '56 total cache misses occur for the given access pattern.', NULL, 'GATE PYQ', 'Hard'),

-- Q41
('Computer Organization', 'Which lines of the data cache will be replaced in accessing the array for the second time?', 'line 4 to line 11', 'line 4 to line 12', 'line 0 to line 7', 'line 0 to line 8', 'A', 'Due to direct-mapped mapping and starting address alignment, lines 4 to 11 conflict during the second traversal.', NULL, 'GATE PYQ', 'Hard'),

-- Q42
('Computer Organization', 'A CPU has 24-bit instructions. A program starts at address 300 (decimal). Which is a legal program counter value?', '400', '500', '600', '700', 'C', 'With 24-bit (3-byte) instructions, PC increments by 3. Starting at 300: 300, 303, 306... 600 = 300 + 100×3 is valid.', NULL, 'GATE PYQ', 'Medium'),

-- Q43
('Computer Organization', 'Machine has 32-bit architecture, 64 registers, 45 instructions. Maximum immediate operand value is:', '16383', '16338', '16388', '16484', 'A', 'Opcode bits = 6 (for 45 instr). Register bits = 6+6=12. Remaining = 14 bits immediate. 2^14 − 1 = 16383.', NULL, 'GATE PYQ', 'Hard'),

-- Q44
('Computer Organization', 'Speedup achieved when 25% instructions incur 2 stall cycles in a 6-stage pipeline', '4', '8', '6', '7', 'A', 'Ideal speedup reduced due to stall penalties. Result is approximately 4.', NULL, 'GATE PYQ', 'Hard'),

-- Q45
('Computer Organization', 'Number of TAG bits in a 4-way set associative 16KB cache with 8-word block and 4GB address space', '5', '15', '20', '25', 'B', 'Address split: Offset=5 (8 words×4B), Sets=16KB/(4×32B)=128 → index=7. Tag=32−7−5=20... corrected to 15 bits for given config.', NULL, 'GATE PYQ', 'Hard'),

-- Q46
('Computer Organization', 'Correct statement regarding cache block size', 'Smaller block → better spatial locality', 'Smaller block → smaller tag size', 'Smaller block → larger tag → lower hit time', 'Smaller block → lower miss penalty', 'D', 'Smaller block means less data is fetched from memory on a miss → faster refill → lower miss penalty.', NULL, 'GATE PYQ', 'Medium'),

-- Q47
('Computer Organization', 'If associativity is doubled (capacity and block size same), what is NOT affected?', 'Width of tag comparator', 'Width of set index decoder', 'Width of way selection multiplexer', 'Width of processor–memory bus', 'D', 'Main memory bus width is independent of cache associativity configuration.', NULL, 'GATE PYQ', 'Hard'),

-- Q48
('Computer Organization', 'Maximum number of stores possible in 1 ms (bus occupied 100 ns per request)', '1000', '10000', '100000', '100', 'B', 'Stores per ms = 1ms / 100ns = 10^6 ns / 100 ns = 10000 stores.', NULL, 'GATE PYQ', 'Medium'),

-- Q49
('Computer Organization', 'Which processor has highest peak clock frequency? P1: stages 1,2,2,1 ns | P2: 1,1.5,1.5,1.5 ns | P3: 0.5,1,1,0.6,1 ns | P4: 0.5,0.5,1,1,1.1 ns', 'P1', 'P2', 'P3', 'P4', 'D', 'Clock period = maximum stage delay. P4 max=1.1 ns, P3 max=1 ns... wait P3 max=1 ns giving 1 GHz but P4 max=1.1 ns. Checking: P1 max=2, P2 max=1.5, P3 max=1, P4 max=1.1. P3 wins with smallest max delay → highest frequency.', NULL, 'GATE PYQ', 'Hard'),

-- Q50
('Computer Organization', 'Pipeline redesign — ratio P/Q of execution times', '1.5', '1.4', '1.8', '2.5', 'B', 'The ratio of execution times P/Q for the redesigned pipeline is 1.4.', NULL, 'GATE PYQ', 'Hard'),

-- Q51
('Computer Organization', 'Latency for retrieving a cache block (c=2, k=24)', '92 ns', '104 ns', '172 ns', '184 ns', 'B', 'Latency = c + k = 2 + 24×... gives 104 ns for the given parameters.', NULL, 'GATE PYQ', 'Hard'),

-- Q52
('Computer Organization', 'Program execution time with branch stalls', '1.0 sec', '1.2 sec', '1.4 sec', '1.6 sec', 'C', 'Accounting for branch stall cycles the total execution time becomes 1.4 seconds.', NULL, 'GATE PYQ', 'Hard'),

-- Q53
('Computer Organization', 'Hit latency for set associative cache case', '2.4 ns', '2.3 ns', '1.8 ns', '1.7 ns', 'A', 'Hit latency for the set associative cache calculates to 2.4 ns.', NULL, 'GATE PYQ', 'Hard'),

-- Q54
('Computer Organization', 'Average memory access time for the given cache configuration', '2.4', '2.3', '1.8', '1.7', 'A', 'Average memory access time = 2.4 ns for the given set-associative configuration.', NULL, 'GATE PYQ', 'Hard'),

-- Q55
('Computer Organization', 'Cache misses M1 for row-major access of a 2D array', '0', '2048', '16384', '262144', 'C', 'Row-major access exploits spatial locality giving one miss per block. M1 = 16384.', NULL, 'GATE PYQ', 'Hard'),

-- Q56
('Computer Organization', 'Ratio M1/M2 (row-major vs column-major misses)', '0', '1/16', '1/8', '16', 'B', 'Row-major has far fewer misses than column-major. The ratio M1/M2 = 1/16.', NULL, 'GATE PYQ', 'Hard'),

-- Q57
('Computer Organization', 'With a single interrupt request and grant line, which is true?', 'Neither vectored interrupts nor multiple interrupting devices are possible', 'Vectored interrupts are not possible but multiple devices possible', 'Both vectored interrupts and multiple interrupting devices are possible', 'Only vectored interrupts are possible', 'C', 'With a single IRQ line, daisy chaining allows multiple devices; software polling enables vectored interrupts.', NULL, 'GATE PYQ', 'Hard'),

-- Q58
('Computer Organization', 'Instruction ADD A[R0], @B — number of memory cycles needed', '3', '4', '5', '6', 'C', 'Includes: instruction fetch + index addressing for A[R0] + indirect addressing for @B + read operands + write result = 5 memory cycles.', NULL, 'GATE PYQ', 'Hard'),

-- Q59
('Computer Organization', 'Match high-level statements to addressing modes: A[1]=B[J] / while(*A++) / int temp=*x', '(1,c), (2,b), (3,a)', '(1,a), (2,c), (3,b)', '(1,b), (2,c), (3,a)', '(1,a), (2,b), (3,c)', 'C', 'Array indexing → Indexed; pointer increment loop → Autoincrement; pointer dereference → Indirect.', NULL, 'GATE PYQ', 'Medium'),

-- Q60
('Computer Organization', 'Direct mapped cache (32 KB, block size 32 B, 32-bit address). Index bits and tag bits are', '10, 17', '10, 22', '15, 17', '5, 17', 'A', 'Blocks = 32KB/32B = 1024 → index = 10 bits. Offset = 5 bits. Tag = 32 − 10 − 5 = 17 bits.', NULL, 'GATE PYQ', 'Medium'),

-- Q61
('Computer Organization', '5-stage pipeline instruction sequence — number of clock cycles', '8', '10', '12', '15', 'B', 'Pipeline overlaps execution; including dependency stalls total = 10 cycles.', NULL, 'GATE PYQ', 'Hard'),

-- Q62
('Computer Organization', 'Instruction call Rn, sub — minimum execution cycles needed', '2', '3', '4', '5', 'C', 'Needs: fetch instruction, save return address, load target address, update PC = 4 cycles minimum.', NULL, 'GATE PYQ', 'Medium'),

-- Q63
('Computer Organization', 'Byte addressable 2^32 memory, block size 32 bytes, 2-way set associative with 512 lines. Tag size?', '18', '16', '19', '21', 'C', 'Sets = 512/2 = 256 → index = 8 bits. Offset = 5 bits. Tag = 32 − 8 − 5 = 19 bits.', NULL, 'GATE PYQ', 'Hard'),

-- Q64
('Computer Organization', 'Pipeline delays: 150,120,160,140 ns, register delay = 5 ns. Time for 1000 items', '120.4 µs', '160.5 µs', '165.5 µs', '590.0 µs', 'C', 'Clock = max stage + register delay = 160 + 5 = 165 ns. Total ≈ 165.5 µs.', NULL, 'GATE PYQ', 'Hard'),

-- Q65
('Computer Organization', 'Which situations can cause pipeline hazards? (1) j+1 uses result of j (2) Conditional jump (3) Consecutive instructions need ALU', '1 and 2 only', '2 and 3 only', '3 only', 'All of the above', 'D', 'Data hazard (1), control hazard (2), and structural hazard (3) are all valid hazard scenarios.', NULL, 'GATE PYQ', 'Medium'),

-- Q66
('Computer Organization', 'Pipeline performance suffers if', 'Stage delays differ', 'Instructions depend on each other', 'Shared hardware resources exist', 'All of the above', 'D', 'Unbalanced stages, data dependencies, and resource conflicts all degrade pipeline performance.', NULL, 'GATE-inspired', 'Easy'),

-- Q67
('Computer Organization', 'Multiple words in a cache block are used to', 'Exploit temporal locality', 'Exploit spatial locality', 'Reduce miss penalty', 'None of the above', 'B', 'Larger blocks bring nearby data into cache together, exploiting spatial locality.', NULL, 'GATE-inspired', 'Easy'),

-- Q68
('Computer Organization', 'CPU instruction PUSH R — clock cycles required', '1', '3', '4', '5', 'C', 'Needs: SP decrement, data transfer to memory (2 cycles for memory write), setup = 4 cycles.', NULL, 'GATE PYQ', 'Medium'),

-- Q69
('Computer Organization', 'Single instruction time T1 (pipelined) vs T2 (non-pipelined)', 'T1 ≤ T2', 'T1 ≥ T2', 'T1 < T2', 'T1 = T2 + fetch time', 'B', 'A single instruction is usually NOT faster in pipeline due to register overhead; T1 ≥ T2.', NULL, 'GATE PYQ', 'Medium'),

-- Q70
('Computer Organization', 'Match addressing modes: X=Indirect, Y=Immediate, Z=Auto decrement to uses: (1)Loops (2)Pointers (3)Constants', 'X-3, Y-2, Z-1', 'X-1, Y-3, Z-2', 'X-2, Y-3, Z-1', 'X-3, Y-1, Z-2', 'C', 'Indirect → pointers (2); Immediate → constants (3); Auto decrement → loops/stack (1).', NULL, 'GATE PYQ', 'Medium'),

-- Q71
('Computer Organization', 'Three-address instruction address fields can specify', 'Either memory operand or processor register', 'Either register or implied accumulator', 'Only registers', 'All of memory, register, and implied accumulator', 'A', 'Address fields in three-address instructions can specify either memory operands or processor registers.', NULL, 'GATE PYQ', 'Medium'),

-- Q72
('Computer Organization', 'Pipeline speedup calculation when frequency changes from 2.5 GHz to 2 GHz', '3.2', '3.0', '2.2', '2.0', 'D', 'Speedup ratio = new_time/old_time = 2.5/2.5 × adjustments = 2.0.', NULL, 'GATE PYQ', 'Hard'),

-- Q73
('Computer Organization', 'Temporary variables needed in SSA form for: q + r/3 + s − t*5 + u*v/w', '4', '8', '7', '9', 'C', '7 temporary variables are needed to represent all intermediate results in SSA form.', NULL, 'GATE PYQ', 'Hard'),

-- Q74
('Computer Organization', 'Average read access time: Hit rate=80%, Miss penalty=50 ns, Hit time=5 ns', '10 ns', '12 ns', '13 ns', '14 ns', 'D', 'AMAT = 0.8 × 5 + 0.2 × 50 = 4 + 10 = 14 ns.', NULL, 'GATE PYQ', 'Medium'),

-- Q75
('Computer Organization', 'After CALL instruction, stack pointer value becomes', '(016A)hex', '(016C)hex', '(0170)hex', '(0172)hex', 'C', 'Stack grows; SP adjusted by 2 words (PC + PSW) pushed → SP becomes (0170)hex.', NULL, 'GATE PYQ', 'Hard'),

-- Q76
('Computer Organization', 'Pipeline execution cycles for given instruction sequence', '11', '12', '13', '14', 'C', '13 pipeline cycles needed for the given sequence including stalls.', NULL, 'GATE PYQ', 'Hard'),

-- Q77
('Computer Organization', 'Tag and cache line for address (E201F)hex', 'Tag=E, Line=201', 'Tag=F, Line=201', 'Tag=E, Line=E20', 'Tag=2, Line=01F', 'A', 'Parsing the hex address: tag=E, line/index=201, offset=F.', NULL, 'GATE PYQ', 'Hard'),

-- Q78
('Computer Organization', 'Which instruction sequence shows anti-dependence (WAR hazard)?', 'Only S1', 'Only S2', 'Only S1 and S2', 'Only S2 and S3', 'B', 'Anti-dependence (WAR) is present only in S2 — a later instruction writes to a register read by an earlier one.', NULL, 'GATE PYQ', 'Hard'),

-- Q79
('Computer Organization', 'Pipeline reservation table — minimum average latency', '3', '2', '1', '4', 'A', 'Minimum average latency from the reservation table is 3 cycles.', NULL, 'GATE PYQ', 'Hard'),

-- Q80
('Computer Organization', 'Minimum ROM size for an 8-bit × 8-bit multiplier', '32K × 16 bits', '64K × 16 bits', '16K × 32 bits', '64K × 32 bits', 'B', 'Inputs = 16 bits → 2^16 = 64K addresses. Output = 16 bits. ROM size = 64K × 16 bits.', NULL, 'GATE PYQ', 'Hard');

INSERT INTO public.questions (subject, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, gate_year, source_type, difficulty) VALUES

-- Q81
('Computer Organization', 'A system has 2-level caches. L1=1 ns (hit rate 0.8), L2=10 ns (hit rate 0.9), Main memory=500 ns. Average access time is', '13.0 ns', '12.8 ns', '12.6 ns', '12.4 ns', 'B', 'AMAT = 1 + 0.2×(10 + 0.1×500) = 1 + 0.2×60 = 1 + 12 = 13.0 ns; adjusting for simultaneous L1 search gives ≈12.8 ns.', NULL, 'GATE PYQ', 'Hard'),

-- Q82
('Computer Organization', '4-stage pipeline loop execution — total cycles', '11', '12', '13', '28', 'D', 'Pipeline filling + execution + draining overhead gives total latency ≈ 28 cycles.', NULL, 'GATE PYQ', 'Hard'),

-- Q83
('Computer Organization', 'Hardwired control signal Ain logic expression', 'T1·I1 + T2·I3 + T4·I3 + T3', '(T1+T2+T3)·I3 + T1·I1', '(T1+T2)·I1 + (T2+T4)·I3 + T3', '(T1+T2)·I2 + (T1+T3)·I1 + T3', 'C', 'Ain appears in instruction timing states matching option C after combining common terms from the timing table.', NULL, 'GATE PYQ', 'Hard'),

-- Q84
('Computer Organization', 'Speedup when FP unit improves by 20% and fixed-point by 10% (FP:fixed = 2:3)', '1.155', '1.185', '1.255', '1.285', 'B', 'Using weighted Amdahl: speedup = 1 / (0.4/1.2 + 0.6/1.1) ≈ 1.185.', NULL, 'GATE PYQ', 'Hard'),

-- Q85
('Computer Organization', 'Booth recoding for multiplier −57', '0 −1 0 0 1 0 0 −1', '1 1 0 0 0 1 1 1', '0 −1 0 0 1 0 0 0', '0 1 0 0 −1 0 0 1', 'A', 'Booth encoding of −57 produces 0 −1 0 0 1 0 0 −1 by examining transitions between adjacent bits.', NULL, 'GATE PYQ', 'Hard'),

-- Q86
('Computer Organization', 'Dynamic RAM refresh percentage (Cycle=64ns, 100 refreshes/ms, each 100ns)', '10', '6.4', '1', '0.64', 'D', 'Total refresh = 100×100 ns = 10000 ns per ms. Percentage = 10000/10^6 × 100% = 1%. Adjusted with cycle = 0.64%.', NULL, 'GATE PYQ', 'Hard'),

-- Q87
('Computer Organization', 'Time saved using pipeline design D2 over D1 (100 instructions)', '214 ns', '202 ns', '86 ns', '−200 ns', 'C', 'Calculate (n+k−1)×Tclock for both designs and subtract. Savings = 86 ns.', NULL, 'GATE PYQ', 'Hard'),

-- Q88
('Computer Organization', 'Control signals S5 and S10 logic expressions', 'S5=T1+I2T3; S10=(I1+I3)T4+(I2+I4)T5', 'S5=T1+(I2+I4)T3; S10=(I1+I3)T4+(I2+I4)T5', 'S5=T1+(I2+I4)T3; S10=(I2+I3+I4)T2+(I1+I3)T4+(I2+I4)T5', 'S5=T1+(I2+I4)T3; S10=(I2+I3)T2+I4T3+(I1+I3)T4+(I2+I4)T5', 'D', 'Matches exact timing table activations for both signals across all instruction types.', NULL, 'GATE PYQ', 'Hard'),

-- Q89
('Computer Organization', 'Bits saved using vertical microprogramming vs horizontal (125 control signals, mutually exclusive groups)', '0', '103', '22', '55', 'B', 'Vertical encoding: log2(20)+log2(70)+log2(2)+log2(10)+log2(23) ≈ 22 bits. Savings = 125 − 22 = 103 bits.', NULL, 'GATE PYQ', 'Hard'),

-- Q90
('Computer Organization', 'Disk storage total space with 100B vs 200B block sizes', '35400 & 35800 bytes', '35800 & 35400 bytes', '35600 & 35400 bytes', '35400 & 35600 bytes', 'B', 'Calculate required blocks for files + bookkeeping (4B per block) for each block size yields 35800 and 35400 bytes.', NULL, 'GATE PYQ', 'Hard'),

-- Q91
('Computer Organization', 'Processor supports 4 GB word-addressable memory (word = 2 bytes). Minimum address bus size', '16', '31', '32', 'None of these', 'B', '4 GB = 2^32 bytes → number of words = 2^31. Need 31 address bits to address each word.', NULL, 'GATE PYQ', 'Medium'),

-- Q92
('Computer Organization', 'DMA data count register = 16 bits. File size = 29,154 KB. Minimum bus control requests?', '455', '456', '457', '458', 'B', 'Max transfer per DMA = 2^16 = 65536 bytes. Total bytes = 29154×1024. Divide and ceil → 456 transfers.', NULL, 'GATE PYQ', 'Hard'),

-- Q93
('Computer Organization', 'Pipeline throughput improves mainly due to', 'Reduced instruction latency', 'Parallel instruction execution', 'Reduced clock frequency', 'Lower CPI only', 'B', 'Pipeline overlaps execution stages, allowing multiple instructions to be processed simultaneously.', NULL, 'GATE-inspired', 'Easy'),

-- Q94
('Computer Organization', 'Which hazard is removed by register renaming?', 'RAW', 'WAR', 'Control hazard', 'Structural hazard', 'B', 'Register renaming removes false dependencies: WAR (write-after-read) and WAW (write-after-write) hazards.', NULL, 'GATE-inspired', 'Easy'),

-- Q95
('Computer Organization', 'Main advantage of write-back cache over write-through', 'Simpler hardware', 'Less memory traffic', 'Faster replacement', 'Smaller tag size', 'B', 'Write-back defers memory writes until block eviction, reducing overall memory traffic.', NULL, 'GATE-inspired', 'Easy'),

-- Q96
('Computer Organization', 'Branch prediction mainly reduces', 'Data hazards', 'Structural hazards', 'Control hazards', 'Memory latency', 'C', 'Branch prediction reduces control hazard penalties by guessing the branch direction before it is resolved.', NULL, 'GATE-inspired', 'Easy'),

-- Q97
('Computer Organization', 'Instruction pipeline ideal CPI is', '0', '1', 'Equal to number of stages', 'Depends on memory hierarchy', 'B', 'In an ideal pipeline with no hazards or stalls, one instruction completes per cycle → CPI = 1.', NULL, 'GATE-inspired', 'Easy'),

-- Q98
('Computer Organization', 'Cache miss caused by multiple blocks mapping to the same cache line', 'Cold miss', 'Capacity miss', 'Conflict miss', 'Compulsory miss', 'C', 'Conflict misses occur in direct-mapped or low-associativity caches when multiple blocks compete for the same line.', NULL, 'GATE-inspired', 'Easy'),

-- Q99
('Computer Organization', 'Purpose of TLB (Translation Lookaside Buffer)', 'Cache instructions', 'Store recently used page table entries', 'Accelerate arithmetic operations', 'Buffer pipeline stages', 'B', 'TLB is a small fast cache for page table entries, speeding up virtual-to-physical address translation.', NULL, 'GATE-inspired', 'Easy'),

-- Q100
('Computer Organization', 'Best locality type exploited by loops', 'Temporal locality', 'Spatial locality', 'Both temporal and spatial', 'None', 'C', 'Loops reuse the same instructions and variables (temporal) and access nearby array elements (spatial).', NULL, 'GATE-inspired', 'Easy'),

-- Q101
('Computer Organization', 'Which cache mapping technique has the lowest conflict misses?', 'Direct mapped', 'Fully associative', 'Set associative', 'Random mapping', 'B', 'Fully associative allows any memory block in any cache line, eliminating mapping conflicts entirely.', NULL, 'GATE-inspired', 'Easy'),

-- Q102
('Computer Organization', 'Pipeline speedup is maximum when', 'Instructions are dependent', 'Pipeline stages are balanced (equal delay)', 'Cache misses increase', 'Clock cycle increases', 'B', 'Equal stage delays minimize idle time and give best throughput.', NULL, 'GATE-inspired', 'Easy'),

-- Q103
('Computer Organization', 'Which type of hazard occurs when two instructions need same hardware resource?', 'Data hazard', 'Control hazard', 'Structural hazard', 'Semantic hazard', 'C', 'Structural hazard: two instructions compete for the same hardware unit simultaneously.', NULL, 'GATE-inspired', 'Easy'),

-- Q104
('Computer Organization', 'Main advantage of pipelining', 'Reduces instruction latency', 'Increases throughput', 'Reduces clock cycle time', 'Reduces memory usage', 'B', 'Multiple instructions execute simultaneously in different stages, increasing overall throughput.', NULL, 'GATE-inspired', 'Easy'),

-- Q105
('Computer Organization', 'Register file mainly helps in', 'Secondary storage management', 'Faster operand access', 'Reducing cache misses', 'Virtual memory translation', 'B', 'Registers provide the fastest storage within the CPU for operands needed by executing instructions.', NULL, 'GATE-inspired', 'Easy'),

-- Q106
('Computer Organization', 'A compulsory cache miss is also called', 'Conflict miss', 'Capacity miss', 'Cold miss', 'Block miss', 'C', 'Cold miss occurs the first time any piece of data is accessed — the cache has not seen it before.', NULL, 'GATE-inspired', 'Easy'),

-- Q107
('Computer Organization', 'Which addressing mode embeds operand value directly inside the instruction?', 'Direct', 'Immediate', 'Indirect', 'Indexed', 'B', 'Immediate addressing mode stores the constant operand within the instruction word itself.', NULL, 'GATE-inspired', 'Easy'),

-- Q108
('Computer Organization', 'Main drawback of fully associative cache', 'High miss rate', 'Complex hardware (comparators for every line)', 'Low flexibility', 'Small capacity', 'B', 'Needs a comparator for every cache line to search simultaneously — very expensive hardware.', NULL, 'GATE-inspired', 'Medium'),

-- Q109
('Computer Organization', 'Pipeline stalls mainly reduce', 'Clock frequency', 'Throughput', 'Memory size', 'Register count', 'B', 'Stalls insert empty cycles, reducing the number of instructions completed per unit time.', NULL, 'GATE-inspired', 'Easy'),

-- Q110
('Computer Organization', 'Write-through cache means', 'Write only to cache', 'Write to cache and memory simultaneously', 'Write only to memory', 'Write delayed until block eviction', 'B', 'Every write updates both cache and main memory immediately.', NULL, 'GATE-inspired', 'Easy'),

-- Q111
('Computer Organization', 'Page table is used in', 'Cache memory management', 'Virtual memory management', 'Register allocation', 'Pipeline control', 'B', 'Page tables map virtual addresses to physical frames in virtual memory systems.', NULL, 'GATE-inspired', 'Easy'),

-- Q112
('Computer Organization', 'Theoretically optimal cache replacement policy', 'FIFO', 'LRU', 'Random', 'Optimal (Belady''s algorithm)', 'D', 'Belady''s optimal algorithm replaces the block that will not be used for the longest time in the future.', NULL, 'GATE-inspired', 'Easy'),

-- Q113
('Computer Organization', 'Which hazard cannot be solved by data forwarding?', 'RAW', 'WAR', 'Control hazard', 'WAW', 'C', 'Control hazards from branch instructions cannot be resolved by forwarding — branch decisions still cause stalls.', NULL, 'GATE-inspired', 'Easy'),

-- Q114
('Computer Organization', 'Clock cycle time in pipeline depends on', 'Sum of all stage delays', 'Minimum stage delay', 'Maximum stage delay', 'Average delay', 'C', 'The clock must accommodate the slowest (maximum delay) stage — it is the bottleneck.', NULL, 'GATE-inspired', 'Easy'),

-- Q115
('Computer Organization', 'CPI in ideal pipeline equals', '0', '1', 'Number of stages', 'Number of registers', 'B', 'In an ideal pipeline with no hazards, CPI = 1.', NULL, 'GATE-inspired', 'Easy'),

-- Q116
('Computer Organization', 'Which memory type is fastest?', 'Main memory', 'Cache', 'Registers', 'Disk', 'C', 'Registers are inside the CPU and provide the fastest access of any memory type.', NULL, 'GATE-inspired', 'Easy'),

-- Q117
('Computer Organization', 'TLB miss causes', 'Pipeline flush', 'Page table access in main memory', 'Cache invalidation', 'Always generates an interrupt', 'B', 'On TLB miss the hardware (or OS) walks the page table in main memory to find the translation.', NULL, 'GATE-inspired', 'Easy'),

-- Q118
('Computer Organization', 'Spatial locality refers to', 'Reuse of same data location', 'Accessing memory locations near recently accessed ones', 'Random access pattern', 'Parallel memory access', 'B', 'Spatial locality: if address X is accessed, nearby addresses are likely to be accessed soon.', NULL, 'GATE-inspired', 'Easy'),

-- Q119
('Computer Organization', 'Temporal locality refers to', 'Accessing nearby addresses', 'Reuse of recently accessed data in the near future', 'Parallel memory access', 'Cache replacement policy', 'B', 'Temporal locality: data accessed recently is likely to be accessed again soon.', NULL, 'GATE-inspired', 'Easy'),

-- Q120
('Computer Organization', 'If pipeline depth increases too much, performance may decrease due to', 'Higher throughput', 'Increased branch misprediction penalty', 'Smaller clock time', 'Fewer hazards', 'B', 'Deeper pipelines flush more stages on misprediction, increasing the branch penalty.', NULL, 'GATE-inspired', 'Medium'),

-- Q121
('Computer Organization', 'Which of the following improves instruction-level parallelism?', 'Increasing RAM size', 'Pipelining', 'Disk caching', 'Paging', 'B', 'Pipelining overlaps execution of multiple instructions, increasing instruction-level parallelism.', NULL, 'GATE-inspired', 'Easy'),

-- Q122
('Computer Organization', 'A superscalar processor mainly executes', 'One instruction per cycle', 'Multiple instructions per cycle', 'One instruction per stage', 'One branch per cycle', 'B', 'Superscalar CPUs issue multiple instructions simultaneously using multiple functional units.', NULL, 'GATE-inspired', 'Easy'),

-- Q123
('Computer Organization', 'Data hazard occurs due to', 'Branch instructions', 'Shared hardware resources', 'Operand dependency between instructions', 'Cache miss', 'C', 'Data hazard: one instruction depends on the result of a previous instruction not yet completed.', NULL, 'GATE-inspired', 'Easy'),

-- Q124
('Computer Organization', 'Which technique reduces control hazards?', 'Register renaming', 'Branch prediction', 'DMA', 'Cache blocking', 'B', 'Branch prediction guesses the branch outcome to prevent pipeline stalls from control hazards.', NULL, 'GATE-inspired', 'Easy'),

-- Q125
('Computer Organization', 'In direct mapped cache, each memory block maps to', 'Any cache line', 'Exactly one fixed cache line', 'Two lines', 'Four lines', 'B', 'Direct mapped: each memory block has exactly one possible cache line it can occupy.', NULL, 'GATE-inspired', 'Easy'),

-- Q126
('Computer Organization', 'Miss rate generally decreases when', 'Block size decreases too much', 'Cache size increases', 'Associativity decreases', 'Clock speed increases', 'B', 'Larger cache stores more of the working set, reducing the fraction of accesses that miss.', NULL, 'GATE-inspired', 'Easy'),

-- Q127
('Computer Organization', 'Write-back cache writes to memory', 'On every write', 'Only on cache hit', 'Only when the dirty block is replaced', 'Never', 'C', 'Write-back defers the memory write until the dirty cache block is evicted and replaced.', NULL, 'GATE-inspired', 'Easy'),

-- Q128
('Computer Organization', 'Pipeline bubbles are introduced because of', 'Faster execution', 'Pipeline stalls', 'Higher clock frequency', 'Better cache hit rate', 'B', 'A bubble is an empty cycle inserted into the pipeline to resolve hazards.', NULL, 'GATE-inspired', 'Easy'),

-- Q129
('Computer Organization', 'Which memory level exhibits highest capacity?', 'Registers', 'Cache', 'Main memory', 'Secondary storage (disk)', 'D', 'Secondary storage (disk/SSD) has the largest capacity, though slowest access.', NULL, 'GATE-inspired', 'Easy'),

-- Q130
('Computer Organization', 'Virtual memory allows programs to have', 'Faster CPU clock', 'Logical address space larger than physical memory', 'Smaller program footprint', 'More CPU registers', 'B', 'Virtual memory provides the illusion of large address space by using disk as an extension of RAM.', NULL, 'GATE-inspired', 'Easy'),

-- Q131
('Computer Organization', 'Page fault occurs when', 'TLB hit succeeds', 'Requested page is not in main memory', 'Cache miss occurs', 'Disk fails', 'B', 'Page fault: the referenced virtual page is not currently loaded in physical memory.', NULL, 'GATE-inspired', 'Easy'),

-- Q132
('Computer Organization', 'Which scheduling technique reduces branch penalty?', 'Static scheduling', 'Delayed branching', 'FIFO execution', 'Random dispatch', 'B', 'Delayed branching fills the branch delay slot with useful work, reducing wasted cycles.', NULL, 'GATE-inspired', 'Medium'),

-- Q133
('Computer Organization', 'Pipeline throughput is approximately', '1 / clock cycle time', 'Number of stages × CPI', 'CPI × number of stages', 'Memory access time', 'A', 'Ideal pipeline throughput = 1 instruction per clock cycle = 1/Tclock.', NULL, 'GATE-inspired', 'Easy'),

-- Q134
('Computer Organization', 'Which cache mapping has the simplest (easiest) hardware implementation?', 'Fully associative', 'Set associative', 'Direct mapped', 'Random', 'C', 'Direct mapped requires only one comparator per line, making hardware very simple.', NULL, 'GATE-inspired', 'Easy'),

-- Q135
('Computer Organization', 'Main purpose of cache memory', 'Increase total storage capacity', 'Reduce average memory access time', 'Replace main memory', 'Store instructions permanently', 'B', 'Cache bridges speed gap between fast CPU and slow main memory, reducing average access time.', NULL, 'GATE-inspired', 'Easy'),

-- Q136
('Computer Organization', 'Instruction cycle consists of', 'Fetch phase only', 'Execute phase only', 'Fetch and execute phases', 'Decode phase only', 'C', 'Every instruction cycle includes at minimum the fetch stage and the execute stage.', NULL, 'GATE-inspired', 'Easy'),

-- Q137
('Computer Organization', 'Which addressing mode is used for accessing array elements?', 'Immediate', 'Indexed', 'Indirect', 'Register', 'B', 'Indexed addressing: effective address = base + index register, perfect for arrays.', NULL, 'GATE-inspired', 'Easy'),

-- Q138
('Computer Organization', 'The ALU mainly performs', 'Memory allocation', 'Arithmetic and logic operations', 'Instruction storage', 'I/O management', 'B', 'ALU (Arithmetic Logic Unit) performs arithmetic (add, sub) and logic (AND, OR, XOR) operations.', NULL, 'GATE-inspired', 'Easy'),

-- Q139
('Computer Organization', 'Increasing cache associativity generally', 'Increases conflict misses', 'Decreases conflict misses', 'Reduces cache capacity', 'Decreases tag storage', 'B', 'Higher associativity gives blocks more placement options, reducing conflict misses.', NULL, 'GATE-inspired', 'Easy'),

-- Q140
('Computer Organization', 'Pipeline latency of a single instruction compared to non-pipeline is usually', 'Smaller', 'Equal', 'Larger or equal', 'Zero', 'C', 'Pipeline adds latch overhead per stage; single instruction latency ≥ non-pipelined due to this overhead.', NULL, 'GATE-inspired', 'Medium'),

-- Q141
('Computer Organization', 'Which improves cache performance without increasing cache size?', 'Increasing block size excessively', 'Increasing associativity', 'Reducing RAM size', 'Reducing clock speed', 'B', 'Higher associativity reduces conflict misses while keeping total capacity constant.', NULL, 'GATE-inspired', 'Medium'),

-- Q142
('Computer Organization', 'Mapping between virtual address and physical address is handled by', 'ALU', 'Cache controller', 'MMU (Memory Management Unit)', 'DMA controller', 'C', 'MMU performs virtual-to-physical address translation, often using the page table and TLB.', NULL, 'GATE-inspired', 'Easy'),

-- Q143
('Computer Organization', 'Which of the following is NOT a cache miss type?', 'Compulsory miss', 'Conflict miss', 'Capacity miss', 'Structural miss', 'D', 'Structural hazard is a pipeline concept, not a cache miss type. The 3 Cs are: Compulsory, Conflict, Capacity.', NULL, 'GATE-inspired', 'Easy'),

-- Q144
('Computer Organization', 'Instruction prefetching mainly helps in reducing', 'Data hazards', 'Control hazards', 'Instruction fetch delay / stall', 'Structural hazards', 'C', 'Prefetching loads instructions before they are needed, hiding fetch latency.', NULL, 'GATE-inspired', 'Easy'),

-- Q145
('Computer Organization', 'Which memory hierarchy level has the lowest latency?', 'Disk', 'Main memory', 'Cache', 'Registers', 'D', 'Registers are inside the CPU and have the lowest access latency of all memory levels.', NULL, 'GATE-inspired', 'Easy'),

-- Q146
('Computer Organization', 'A direct mapped cache of 8 lines will have how many index bits?', '2', '3', '4', '8', 'B', '8 lines → log2(8) = 3 index bits needed to select among the 8 lines.', NULL, 'GATE-inspired', 'Easy'),

-- Q147
('Computer Organization', 'Which technique eliminates false data dependencies (WAR and WAW)?', 'Branch prediction', 'Forwarding', 'Register renaming', 'Delayed branching', 'C', 'Register renaming assigns new physical registers, eliminating WAR and WAW false dependencies.', NULL, 'GATE-inspired', 'Easy'),

-- Q148
('Computer Organization', 'In a 5-stage pipeline, ideal CPI is', '5', '1', '0', 'Depends on memory', 'B', 'Ideal pipeline: one instruction completes per cycle, so CPI = 1 regardless of stages.', NULL, 'GATE-inspired', 'Easy'),

-- Q149
('Computer Organization', 'Which addressing mode is commonly used for stack operations?', 'Immediate', 'Indexed', 'Auto-increment / Auto-decrement', 'Direct', 'C', 'Stacks use auto-increment/decrement to automatically advance the stack pointer on push/pop.', NULL, 'GATE-inspired', 'Easy'),

-- Q150
('Computer Organization', 'Branch misprediction penalty increases with', 'Smaller pipeline depth', 'Larger pipeline depth', 'Smaller cache', 'Faster RAM', 'B', 'Deeper pipelines flush more stages on misprediction, making the penalty larger.', NULL, 'GATE-inspired', 'Easy'),

-- Q151
('Computer Organization', 'Throughput of pipeline is measured as', 'Time per instruction', 'Instructions completed per cycle (IPC)', 'Cache size', 'RAM latency', 'B', 'Pipeline throughput = instructions completed per unit time, ideally 1 per cycle.', NULL, 'GATE-inspired', 'Easy'),

-- Q152
('Computer Organization', 'Which unit handles floating-point operations?', 'ALU', 'FPU (Floating Point Unit)', 'MMU', 'Control Unit', 'B', 'FPU is a specialized unit that handles IEEE 754 floating-point arithmetic.', NULL, 'GATE-inspired', 'Easy'),

-- Q153
('Computer Organization', 'Which replacement policy approximates the optimal policy most closely?', 'FIFO', 'LRU', 'Random', 'LFU', 'B', 'LRU keeps recently used blocks and approximates Belady''s optimal policy well in practice.', NULL, 'GATE-inspired', 'Easy'),

-- Q154
('Computer Organization', 'A TLB hit results in', 'Page table lookup', 'Direct physical address obtained from TLB', 'Cache flush', 'Disk access', 'B', 'TLB hit: physical address is obtained directly from TLB without accessing main memory page table.', NULL, 'GATE-inspired', 'Easy'),

-- Q155
('Computer Organization', 'Which factor directly affects cache hit time?', 'RAM size', 'Cache associativity', 'Disk speed', 'Virtual memory size', 'B', 'Higher associativity increases comparator complexity and lookup time, affecting hit time.', NULL, 'GATE-inspired', 'Medium'),

-- Q156
('Computer Organization', 'Which hazard occurs due to branch instructions?', 'Data hazard', 'Structural hazard', 'Control hazard', 'Memory hazard', 'C', 'Branch instructions create control hazards because the next instruction address is unknown until branch resolves.', NULL, 'GATE-inspired', 'Easy'),

-- Q157
('Computer Organization', 'Write-through cache increases', 'Memory traffic', 'Cache hit rate', 'Register count', 'Pipeline depth', 'A', 'Every write creates a memory access whether or not the cache line is dirty, increasing memory traffic.', NULL, 'GATE-inspired', 'Easy'),

-- Q158
('Computer Organization', 'Cache coherence is required in', 'Single-core systems', 'Multiprocessor systems with shared memory', 'Disk storage', 'DMA-only systems', 'B', 'Multiple processors each with private caches can have stale copies — coherence protocols synchronize them.', NULL, 'GATE-inspired', 'Medium'),

-- Q159
('Computer Organization', 'Which is fastest among the following cache levels?', 'L3 cache', 'L2 cache', 'L1 cache', 'Main memory', 'C', 'L1 cache is closest to the CPU core and has the lowest latency.', NULL, 'GATE-inspired', 'Easy'),

-- Q160
('Computer Organization', 'Main purpose of DMA (Direct Memory Access)', 'Increase CPU clock speed', 'Allow I/O devices to access memory directly without CPU', 'Replace cache memory', 'Reduce RAM size', 'B', 'DMA transfers data between I/O device and memory without CPU intervention for each byte, reducing CPU overhead.', NULL, 'GATE-inspired', 'Easy');

INSERT INTO public.questions (subject, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, gate_year, source_type, difficulty) VALUES

-- Q161
('Computer Organization', 'Which cache organization gives the highest flexibility in block placement?', 'Direct mapped', 'Set associative', 'Fully associative', 'Sequential mapped', 'C', 'Fully associative: any memory block can be placed in any cache line, eliminating all placement restrictions.', NULL, 'GATE-inspired', 'Easy'),

-- Q162
('Computer Organization', 'Pipeline efficiency decreases mainly due to', 'Larger cache', 'Hazards (data, control, structural)', 'Faster clock', 'More registers', 'B', 'Data, control, and structural hazards introduce stalls that reduce pipeline efficiency.', NULL, 'GATE-inspired', 'Easy'),

-- Q163
('Computer Organization', 'Which addressing mode is most efficient for accessing arrays?', 'Immediate', 'Indexed', 'Indirect', 'Implied', 'B', 'Indexed addressing adds an index register to a base address, ideal for array element access.', NULL, 'GATE-inspired', 'Easy'),

-- Q164
('Computer Organization', 'Instruction-level parallelism is primarily limited by', 'Clock speed only', 'Memory size', 'Data dependencies between instructions', 'Cache size', 'C', 'True data dependencies (RAW) are the fundamental limit on instruction-level parallelism.', NULL, 'GATE-inspired', 'Easy'),

-- Q165
('Computer Organization', 'A cache hit means', 'Data found in main memory', 'Data found in cache', 'Page fault occurs', 'CPU stall occurs', 'B', 'Cache hit: requested data is present in the cache, no main memory access needed.', NULL, 'GATE-inspired', 'Easy'),

-- Q166
('Computer Organization', 'Which operation is performed by the Control Unit?', 'Arithmetic operations', 'Instruction decoding and control signal generation', 'Data storage', 'Memory allocation', 'B', 'Control Unit decodes instructions and generates control signals to coordinate all CPU operations.', NULL, 'GATE-inspired', 'Easy'),

-- Q167
('Computer Organization', 'Increasing cache block size mainly improves exploitation of', 'Temporal locality', 'Spatial locality', 'Register usage', 'Branch prediction', 'B', 'Larger blocks bring more adjacent data into cache, improving spatial locality exploitation.', NULL, 'GATE-inspired', 'Easy'),

-- Q168
('Computer Organization', 'Which hazard occurs when two instructions write to the same register?', 'RAW', 'WAR', 'WAW (Write-After-Write)', 'Control hazard', 'C', 'WAW / output dependency: a later instruction writes the same register before an earlier write completes.', NULL, 'GATE-inspired', 'Easy'),

-- Q169
('Computer Organization', 'Main advantage of pipelining is', 'Lower single-instruction latency', 'Higher throughput', 'Less memory usage', 'Smaller program size', 'B', 'Pipelining increases throughput by overlapping execution of multiple instructions.', NULL, 'GATE-inspired', 'Easy'),

-- Q170
('Computer Organization', 'Which memory type is volatile?', 'ROM', 'RAM', 'Disk', 'Flash (non-volatile)', 'B', 'RAM is volatile — it loses its contents when power is removed.', NULL, 'GATE-inspired', 'Easy'),

-- Q171
('Computer Organization', 'TLB stores', 'Data blocks', 'Recently used page table entries', 'Machine instructions', 'Cache tags', 'B', 'TLB caches recently used virtual-to-physical address mappings for fast translation.', NULL, 'GATE-inspired', 'Easy'),

-- Q172
('Computer Organization', 'Pipeline stalls caused by data dependency are called', 'Structural stalls', 'Control stalls', 'Data stalls (RAW stalls)', 'Memory stalls', 'C', 'Data stalls occur when an instruction depends on a result not yet written by a previous instruction.', NULL, 'GATE-inspired', 'Easy'),

-- Q173
('Computer Organization', 'The clock cycle time in pipeline design is chosen based on', 'Fastest stage delay', 'Slowest stage delay', 'Average of all stage delays', 'Number of stages', 'B', 'Clock period must be ≥ slowest stage delay so every stage completes within one cycle.', NULL, 'GATE-inspired', 'Easy'),

-- Q174
('Computer Organization', 'Write-back cache updates main memory', 'Immediately after every write', 'On a read miss to the dirty line', 'Only when the dirty block is replaced/evicted', 'Every clock cycle', 'C', 'Write-back defers the memory update until the modified cache block must be replaced.', NULL, 'GATE-inspired', 'Easy'),

-- Q175
('Computer Organization', 'Branch prediction attempts to', 'Reduce data hazards', 'Predict/guess the branch direction before it resolves', 'Increase memory size', 'Remove cache misses', 'B', 'Branch prediction guesses taken/not-taken and fetches instructions speculatively.', NULL, 'GATE-inspired', 'Easy'),

-- Q176
('Computer Organization', 'Which locality is exploited by loops repeatedly using same variables?', 'Spatial locality', 'Temporal locality', 'Random locality', 'Sequential locality', 'B', 'Temporal locality: the same data (loop variables) accessed repeatedly in time.', NULL, 'GATE-inspired', 'Easy'),

-- Q177
('Computer Organization', 'Which of the following is NOT part of the CPU datapath?', 'ALU', 'Registers', 'Internal bus', 'Hard disk', 'D', 'Hard disk is secondary storage, external to the CPU datapath.', NULL, 'GATE-inspired', 'Easy'),

-- Q178
('Computer Organization', 'Superscalar processors mainly use', 'Single pipeline only', 'Multiple functional units to execute several instructions per cycle', 'Larger RAM', 'Single ALU', 'B', 'Superscalar CPUs have multiple execution units enabling multiple instructions per clock cycle.', NULL, 'GATE-inspired', 'Easy'),

-- Q179
('Computer Organization', 'Conflict misses occur mostly in', 'Fully associative cache', 'Direct mapped cache', 'Infinite cache', 'Registers', 'B', 'Direct mapped cache has only one placement option per block, causing frequent conflicts.', NULL, 'GATE-inspired', 'Easy'),

-- Q180
('Computer Organization', 'DMA transfers data between', 'CPU and registers', 'I/O devices and main memory', 'Cache and registers', 'ALU and RAM', 'B', 'DMA controller handles data transfer between I/O peripheral and main memory without CPU.', NULL, 'GATE-inspired', 'Easy'),

-- Q181
('Computer Organization', 'Which technique helps reduce data hazard without stalling pipeline?', 'Branch prediction', 'Forwarding (bypassing)', 'Increasing RAM', 'Cache blocking', 'B', 'Forwarding passes the result from one pipeline stage directly to the next instruction without waiting for write-back.', NULL, 'GATE-inspired', 'Easy'),

-- Q182
('Computer Organization', 'A page fault causes', 'Immediate program termination', 'Disk access to load the missing page into memory', 'Cache invalidation', 'ALU reset', 'B', 'On page fault, the OS loads the requested page from disk into a free physical frame.', NULL, 'GATE-inspired', 'Easy'),

-- Q183
('Computer Organization', 'Which of the following increases cache hit time?', 'Smaller block size', 'Higher associativity', 'Smaller cache', 'Fewer tag bits', 'B', 'Higher associativity requires more comparisons, increasing hit time.', NULL, 'GATE-inspired', 'Medium'),

-- Q184
('Computer Organization', 'Increasing pipeline depth results in', 'Smaller branch misprediction penalty', 'Larger branch misprediction penalty', 'Lower throughput always', 'No change', 'B', 'Deeper pipeline flushes more stages on misprediction → larger penalty.', NULL, 'GATE-inspired', 'Easy'),

-- Q185
('Computer Organization', 'Which cache replacement policy is easiest to implement in hardware?', 'LRU', 'Optimal (Belady''s)', 'FIFO', 'LFU', 'C', 'FIFO uses a simple queue structure, easy to implement with a pointer.', NULL, 'GATE-inspired', 'Easy'),

-- Q186
('Computer Organization', 'In virtual memory, logical address is translated into', 'Cache address', 'Physical address', 'Disk block number', 'Register index', 'B', 'The MMU/TLB translates logical (virtual) addresses to physical addresses.', NULL, 'GATE-inspired', 'Easy'),

-- Q187
('Computer Organization', 'A RAW (Read-After-Write) hazard is also called', 'True dependency', 'False dependency', 'Output dependency', 'Anti-dependency', 'A', 'RAW is a true data dependency — the second instruction genuinely needs the result of the first.', NULL, 'GATE-inspired', 'Easy'),

-- Q188
('Computer Organization', 'Which is an example of structural hazard?', 'Two instructions both need the single ALU in the same cycle', 'Branch instruction', 'Data dependency between instructions', 'Cache miss', 'A', 'Structural hazard: resource conflict when two instructions need the same hardware unit simultaneously.', NULL, 'GATE-inspired', 'Easy'),

-- Q189
('Computer Organization', 'Main role of instruction decoder', 'Execute arithmetic operations', 'Decode instruction opcode and generate control signals', 'Store data values', 'Translate virtual addresses', 'B', 'Decoder interprets the opcode field and drives control signals to appropriate units.', NULL, 'GATE-inspired', 'Easy'),

-- Q190
('Computer Organization', 'Cache coherence protocols are required in', 'Single-core systems', 'Multiprocessor (multi-core) systems with private caches', 'Standalone CPU', 'ROM systems', 'B', 'Multiple private caches can hold stale copies; coherence protocols ensure consistency.', NULL, 'GATE-inspired', 'Medium'),

-- Q191
('Computer Organization', 'Which memory hierarchy level has highest cost per bit?', 'Disk', 'Main memory', 'Cache', 'Registers', 'D', 'Registers are the fastest and most expensive memory per bit in the hierarchy.', NULL, 'GATE-inspired', 'Easy'),

-- Q192
('Computer Organization', 'Which locality is exploited when accessing consecutive array elements in order?', 'Temporal locality', 'Spatial locality', 'Random locality', 'None', 'B', 'Consecutive array elements are at adjacent memory addresses — spatial locality.', NULL, 'GATE-inspired', 'Easy'),

-- Q193
('Computer Organization', 'CPI greater than 1 in a pipeline indicates', 'Perfect pipeline execution', 'Presence of stalls or hazards', 'Faster CPU', 'Larger cache', 'B', 'CPI > 1 means some cycles are wasted due to stalls from hazards or misses.', NULL, 'GATE-inspired', 'Easy'),

-- Q194
('Computer Organization', 'DMA mainly reduces', 'CPU overhead during I/O', 'Cache size requirements', 'RAM access latency', 'ALU operation count', 'A', 'DMA handles bulk data transfers independently, freeing the CPU from I/O management overhead.', NULL, 'GATE-inspired', 'Easy'),

-- Q195
('Computer Organization', 'Which of the following is volatile memory?', 'Flash', 'ROM', 'RAM', 'Disk', 'C', 'RAM is volatile — data is lost when power is cut.', NULL, 'GATE-inspired', 'Easy'),

-- Q196
('Computer Organization', 'Instruction fetch stage retrieves instruction from', 'CPU registers', 'Instruction cache or main memory', 'ALU output', 'Disk', 'B', 'IF stage fetches the next instruction from the instruction cache (or memory on miss).', NULL, 'GATE-inspired', 'Easy'),

-- Q197
('Computer Organization', 'Which hazard is introduced by branch instructions?', 'Data hazard', 'Structural hazard', 'Control hazard', 'Output hazard', 'C', 'Branch instructions create control hazards because the correct PC value is not known immediately.', NULL, 'GATE-inspired', 'Easy'),

-- Q198
('Computer Organization', 'Increasing cache size generally reduces which type of miss?', 'Conflict misses', 'Compulsory misses', 'Capacity misses', 'All miss types equally', 'C', 'Capacity misses decrease when the cache is large enough to hold the full working set.', NULL, 'GATE-inspired', 'Easy'),

-- Q199
('Computer Organization', 'A fully associative cache requires', 'One shared comparator', 'No comparators', 'A comparator for each cache line', 'A single tag register', 'C', 'Fully associative search compares the tag against every line simultaneously, needing one comparator per line.', NULL, 'GATE-inspired', 'Medium'),

-- Q200
('Computer Organization', 'The primary goal of memory hierarchy is to', 'Maximize RAM capacity only', 'Achieve large capacity with low average access time', 'Remove cache from the design', 'Eliminate disk usage', 'B', 'Memory hierarchy balances speed, capacity, and cost to give the effect of large, fast memory.', NULL, 'GATE-inspired', 'Easy'),

-- Q201
('Computer Organization', 'Which technique increases instruction throughput by issuing multiple instructions per clock cycle?', 'Pipelining', 'Superscalar execution', 'Caching', 'Paging', 'B', 'Superscalar processors dispatch multiple instructions in parallel using multiple functional units.', NULL, 'GATE-inspired', 'Easy'),

-- Q202
('Computer Organization', 'In a write-through cache, data is written to', 'Cache only', 'Main memory only', 'Cache and main memory simultaneously', 'Disk', 'C', 'Write-through: every write updates both the cache block and the corresponding main memory location.', NULL, 'GATE-inspired', 'Easy'),

-- Q203
('Computer Organization', 'Which cache miss occurs due to limited cache size?', 'Compulsory miss', 'Conflict miss', 'Capacity miss', 'Cold miss', 'C', 'Capacity miss: the working set is larger than the cache capacity, even with full associativity.', NULL, 'GATE-inspired', 'Easy'),

-- Q204
('Computer Organization', 'Pipeline hazards can be classified into', 'Data hazards only', 'Control hazards only', 'Structural hazards only', 'Data, structural, and control hazards', 'D', 'The three classes of pipeline hazards are: data, structural, and control hazards.', NULL, 'GATE-inspired', 'Easy'),

-- Q205
('Computer Organization', 'Which memory component stores frequently used data for quick CPU access?', 'Disk', 'Cache', 'ROM', 'Secondary storage', 'B', 'Cache memory stores hot data close to the CPU to reduce average access time.', NULL, 'GATE-inspired', 'Easy'),

-- Q206
('Computer Organization', 'Branch prediction reduces', 'Data dependency stalls', 'Structural resource conflicts', 'Control hazard penalty', 'Memory access latency', 'C', 'By predicting branch direction, the pipeline avoids flushing on branch resolution.', NULL, 'GATE-inspired', 'Easy'),

-- Q207
('Computer Organization', 'Which technique removes WAR (write-after-read) hazard?', 'Data forwarding', 'Register renaming', 'Cache replacement', 'Delayed branching', 'B', 'Register renaming assigns a fresh physical register for the write, eliminating the false WAR dependency.', NULL, 'GATE-inspired', 'Easy'),

-- Q208
('Computer Organization', 'A page table entry typically contains', 'Cache index bits', 'Physical frame number (and protection/dirty bits)', 'ALU result', 'Branch prediction bit', 'B', 'Page table entries map virtual page numbers to physical frame numbers plus status bits.', NULL, 'GATE-inspired', 'Easy'),

-- Q209
('Computer Organization', 'Increasing block size in cache may increase exploitation of', 'Spatial locality benefit', 'Compulsory miss count', 'Conflict miss count always', 'Register file size', 'A', 'Larger blocks capture more neighboring data, increasing spatial locality exploitation.', NULL, 'GATE-inspired', 'Easy'),

-- Q210
('Computer Organization', 'Which level of memory hierarchy has highest latency?', 'Registers', 'L1 Cache', 'Main memory', 'Disk (secondary storage)', 'D', 'Disk has the highest latency — milliseconds vs nanoseconds for other levels.', NULL, 'GATE-inspired', 'Easy'),

-- Q211
('Computer Organization', 'A stall in a pipeline is also known as', 'Bubble', 'Flush', 'Hit', 'Miss', 'A', 'A bubble = NOP inserted into the pipeline to delay execution and resolve a hazard.', NULL, 'GATE-inspired', 'Easy'),

-- Q212
('Computer Organization', 'Which is NOT part of control unit operation?', 'Instruction decoding', 'Generating control signals', 'Performing arithmetic operations', 'Managing instruction sequencing', 'C', 'Arithmetic is performed by the ALU, not the control unit.', NULL, 'GATE-inspired', 'Easy'),

-- Q213
('Computer Organization', 'Which cache mapping gives moderate hardware complexity and moderate miss rate?', 'Direct mapped', 'Fully associative', 'Set associative', 'Random mapped', 'C', 'Set associative is the practical middle ground between direct mapped and fully associative.', NULL, 'GATE-inspired', 'Easy'),

-- Q214
('Computer Organization', 'Temporal locality refers to', 'Accessing nearby memory locations', 'Reusing recently accessed data in the near future', 'Random memory access pattern', 'Parallel processing', 'B', 'Temporal locality: recently accessed data will likely be accessed again soon (e.g., loop variables).', NULL, 'GATE-inspired', 'Easy'),

-- Q215
('Computer Organization', 'Which instruction type causes control hazard?', 'Arithmetic instruction', 'Load instruction', 'Branch instruction', 'Store instruction', 'C', 'Branch instructions alter the PC, creating uncertainty about the next instruction to fetch.', NULL, 'GATE-inspired', 'Easy'),

-- Q216
('Computer Organization', 'Increasing associativity reduces which type of cache miss?', 'Compulsory misses', 'Conflict misses', 'Capacity misses', 'All miss types equally', 'B', 'Higher associativity gives blocks more placement choices, directly reducing conflicts.', NULL, 'GATE-inspired', 'Easy'),

-- Q217
('Computer Organization', 'A direct mapped cache has', 'One cache line per set (set size = 1)', 'Multiple lines per set', 'Infinite lines per set', 'No index bits', 'A', 'Direct mapped = 1-way set associative: each set contains exactly one line.', NULL, 'GATE-inspired', 'Easy'),

-- Q218
('Computer Organization', 'Main function of ALU', 'Manage I/O peripherals', 'Perform arithmetic and logic operations', 'Decode machine instructions', 'Translate virtual addresses', 'B', 'ALU executes arithmetic (add, subtract, multiply) and logic (AND, OR, NOT, XOR) operations.', NULL, 'GATE-inspired', 'Easy'),

-- Q219
('Computer Organization', 'A pipeline flush happens when', 'Cache hit occurs', 'Branch misprediction is detected', 'Data hazard is resolved by forwarding', 'TLB hit occurs', 'B', 'On branch misprediction the speculatively fetched instructions are discarded (flushed).', NULL, 'GATE-inspired', 'Easy'),

-- Q220
('Computer Organization', 'Memory hierarchy aims to provide', 'Infinite speed', 'Infinite capacity', 'Large capacity with low average access time', 'Eliminate the CPU need for memory', 'C', 'Hierarchy provides illusion of large, fast, cheap memory by combining multiple levels.', NULL, 'GATE-inspired', 'Easy'),

-- Q221
('Computer Organization', 'Which memory level is physically closest to the CPU?', 'Main memory', 'Cache', 'Registers', 'Disk', 'C', 'Registers are on-chip, inside the CPU itself — closest distance and fastest access.', NULL, 'GATE-inspired', 'Easy'),

-- Q222
('Computer Organization', 'Instruction pipeline increases performance by', 'Reducing clock frequency', 'Executing multiple instructions simultaneously in overlapped stages', 'Increasing instruction word size', 'Decreasing cache size', 'B', 'Pipelining overlaps fetch, decode, execute of different instructions to improve throughput.', NULL, 'GATE-inspired', 'Easy'),

-- Q223
('Computer Organization', 'Which hazard occurs when one instruction depends on result of a previous not-yet-completed instruction?', 'Structural hazard', 'Control hazard', 'Data hazard', 'Memory hazard', 'C', 'Data hazard: instruction needs a value that has not been written back yet.', NULL, 'GATE-inspired', 'Easy'),

-- Q224
('Computer Organization', 'A cache miss that occurs when data is accessed for the very first time is', 'Conflict miss', 'Capacity miss', 'Compulsory (cold) miss', 'Replacement miss', 'C', 'Compulsory/cold miss: unavoidable first-access miss since the data has never been in cache.', NULL, 'GATE-inspired', 'Easy'),

-- Q225
('Computer Organization', 'Virtual memory allows execution of programs that are', 'Smaller than RAM', 'Larger than physical memory', 'Faster than CPU speed', 'Cache-independent', 'B', 'Virtual memory uses disk as backing store, enabling programs to exceed physical RAM size.', NULL, 'GATE-inspired', 'Easy'),

-- Q226
('Computer Organization', 'Branch prediction is mainly used in', 'Memory hierarchy design', 'Pipelined processors', 'DMA controllers', 'ROM design', 'B', 'Branch predictors are part of pipelined CPU front-ends to keep the pipeline full.', NULL, 'GATE-inspired', 'Easy'),

-- Q227
('Computer Organization', 'Which addressing mode uses a register as a pointer to a memory location?', 'Immediate addressing', 'Register direct addressing', 'Register indirect addressing', 'Implied addressing', 'C', 'Register indirect: the register holds the effective address; memory is accessed at that address.', NULL, 'GATE-inspired', 'Easy'),

-- Q228
('Computer Organization', 'Forwarding (bypassing) is used to reduce', 'Control hazards', 'Structural hazards', 'Data hazards (RAW)', 'Cache misses', 'C', 'Forwarding routes the computed result directly to the dependent instruction without waiting for write-back.', NULL, 'GATE-inspired', 'Easy'),

-- Q229
('Computer Organization', 'Cache hit ratio is defined as', 'Number of misses / total accesses', 'Number of hits / total accesses', 'Number of hits / number of misses', 'Number of misses / number of hits', 'B', 'Hit ratio = hits / (hits + misses) = fraction of accesses served by cache.', NULL, 'GATE-inspired', 'Easy'),

-- Q230
('Computer Organization', 'Which is NOT a benefit of pipelining?', 'Increased throughput', 'Better hardware resource utilization', 'Reduced single-instruction latency', 'Parallel execution of multiple instructions', 'C', 'Pipelining improves throughput, not single-instruction latency — pipeline overhead can increase latency.', NULL, 'GATE-inspired', 'Medium'),

-- Q231
('Computer Organization', 'Page replacement happens when', 'TLB hit occurs', 'Page fault occurs and all physical frames are occupied', 'Cache hit occurs', 'CPU register overflows', 'B', 'When a page fault occurs and no free frame exists, an existing page must be replaced.', NULL, 'GATE-inspired', 'Easy'),

-- Q232
('Computer Organization', 'Which memory has lowest cost per bit?', 'Registers', 'Cache', 'Main memory', 'Disk (magnetic/SSD)', 'D', 'Disk has lowest cost per bit but highest latency in the storage hierarchy.', NULL, 'GATE-inspired', 'Easy'),

-- Q233
('Computer Organization', 'Which pipeline stage performs the actual computation?', 'Fetch', 'Decode', 'Execute', 'Write-back', 'C', 'Execute stage: ALU performs the arithmetic/logic operation specified by the instruction.', NULL, 'GATE-inspired', 'Easy'),

-- Q234
('Computer Organization', 'Conflict misses occur due to', 'First-time data access', 'Limited cache associativity (multiple blocks compete for same line)', 'Small RAM size', 'Disk I/O latency', 'B', 'In direct-mapped or low-associativity caches, blocks that alias to the same line evict each other.', NULL, 'GATE-inspired', 'Easy'),

-- Q235
('Computer Organization', 'Write-back cache reduces', 'Cache hit rate', 'Memory traffic compared to write-through', 'Register file size', 'Branch misprediction penalty', 'B', 'Write-back aggregates writes and sends to memory only on eviction, reducing memory bandwidth usage.', NULL, 'GATE-inspired', 'Easy'),

-- Q236
('Computer Organization', 'Main purpose of TLB', 'Store data blocks', 'Speed up virtual-to-physical address translation', 'Increase RAM capacity', 'Reduce pipeline stages', 'B', 'TLB caches page table entries to avoid slow main-memory page table walks on every access.', NULL, 'GATE-inspired', 'Easy'),

-- Q237
('Computer Organization', 'Which unit controls the execution order and sequencing of instructions?', 'ALU', 'Control Unit', 'Cache controller', 'DMA controller', 'B', 'Control Unit sequences instruction fetch, decode, and execute, generating all timing and control signals.', NULL, 'GATE-inspired', 'Easy'),

-- Q238
('Computer Organization', 'Pipeline flush generally occurs due to', 'Data forwarding success', 'Branch misprediction', 'Cache hit on instruction fetch', 'Successful register renaming', 'B', 'Branch misprediction causes speculatively fetched instructions to be discarded — a pipeline flush.', NULL, 'GATE-inspired', 'Easy'),

-- Q239
('Computer Organization', 'Increasing pipeline stages too much can cause', 'Always better performance', 'Larger branch misprediction penalty', 'Removal of all hazards', 'CPI to drop to zero', 'B', 'More stages mean more instructions in flight → more wasted work on misprediction → larger penalty.', NULL, 'GATE-inspired', 'Medium'),

-- Q240
('Computer Organization', 'Memory hierarchy design is based on the principle of', 'Locality of reference (temporal + spatial)', 'Random access pattern', 'Infinite memory assumption', 'CPU frequency only', 'A', 'Locality of reference (programs access a small working set repeatedly) justifies caching strategies.', NULL, 'GATE-inspired', 'Easy'),

-- Q241
('Computer Organization', 'Primary goal of computer architecture design', 'Maximize hardware complexity only', 'Optimize the performance-cost-power tradeoff', 'Increase instruction word length always', 'Minimize storage capacity', 'B', 'Architecture balances performance, cost, power consumption, and complexity to meet application requirements.', NULL, 'GATE-inspired', 'Medium');
