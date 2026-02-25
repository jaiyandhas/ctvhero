-- ============================================================
-- Padichiya — Seed Questions from GeeksForGeeks PDFs
-- Run AFTER supabase_schema.sql
-- ============================================================

-- Data Structures (hand-curated high quality questions)
INSERT INTO public.questions (subject, question_text, option_a, option_b, option_c, option_d, correct_answer, explanation, gate_year, source_type, difficulty) VALUES

-- Data Structures
('Data Structures', 'Which data structure is used for implementing recursion?', 'Queue', 'Stack', 'Array', 'Linked List', 'B', 'Recursion uses the call stack. When a function calls itself, the return address and local variables are pushed onto the system stack, and popped when the function returns.', NULL, 'GATE-inspired', 'Easy'),

('Data Structures', 'The time complexity of inserting an element at the beginning of a singly linked list is:', 'O(n)', 'O(log n)', 'O(1)', 'O(n log n)', 'C', 'Inserting at the beginning of a singly linked list only requires updating the head pointer, making no comparisons — hence O(1).', NULL, 'GATE-inspired', 'Easy'),

('Data Structures', 'In a binary search tree (BST), what is the worst-case time complexity of search?', 'O(1)', 'O(log n)', 'O(n)', 'O(n log n)', 'C', 'In a skewed BST (all nodes on one side), the tree degenerates into a linked list. Searching requires traversing all n nodes — O(n) worst case.', NULL, 'GATE PYQ', 'Medium'),

('Data Structures', 'Which sorting algorithm has the best average-case time complexity?', 'Bubble Sort', 'Merge Sort', 'Quick Sort', 'Insertion Sort', 'C', 'Quick Sort has average-case O(n log n). With good pivot selection (randomized), it outperforms most algorithms in practice due to cache efficiency, though worst-case is O(n²).', NULL, 'GATE-inspired', 'Medium'),

('Data Structures', 'A hash table uses chaining with n elements and m chains. What is the expected time for a successful lookup?', 'O(1)', 'O(n/m)', 'O(m/n)', 'O(n)', 'B', 'With n elements distributed among m chains (load factor α = n/m), the expected chain length is n/m. So expected search time is Θ(1 + n/m).', 2018, 'GATE PYQ', 'Hard'),

('Data Structures', 'What is the height of a complete binary tree with n nodes?', 'log(n)', 'n', 'n/2', 'n log n', 'A', 'A complete binary tree with n nodes has height ⌊log₂(n)⌋. Each level doubles the number of nodes, so height grows logarithmically.', NULL, 'GATE-inspired', 'Easy'),

('Data Structures', 'Which traversal of a binary search tree gives elements in sorted order?', 'Preorder', 'Postorder', 'Inorder', 'Level order', 'C', 'Inorder traversal (Left → Root → Right) visits BST nodes in ascending sorted order because all left descendants are smaller than root and all right descendants are larger.', NULL, 'Practice Question', 'Easy'),

('Data Structures', 'What data structure is best suited for implementing a priority queue?', 'Stack', 'Linked List', 'Heap', 'Array', 'C', 'A binary heap supports insert and extract-min/max both in O(log n). Arrays and linked lists require O(n) for one of these operations.', NULL, 'GATE-inspired', 'Medium'),

('Data Structures', 'In Dijkstra''s algorithm using a min-heap, what is the overall time complexity?', 'O(V²)', 'O(E log V)', 'O(V log E)', 'O(VE)', 'B', 'With a min-heap, each edge relaxation is O(log V). Total time is O((V + E) log V) ≈ O(E log V) for connected graphs.', 2016, 'GATE PYQ', 'Hard'),

('Data Structures', 'A queue is implemented using a circular array of size n. After k enqueue and m dequeue operations, the front pointer is at:', '(k - m) mod n', '(m - k) mod n', 'm mod n', 'k mod n', 'C', 'The front pointer advances by 1 for each dequeue. After m dequeue operations starting from position 0, front = m mod n (using circular wrap-around).', NULL, 'GATE-inspired', 'Hard'),

-- Computer Organization
('Computer Organization', 'Which of the following is NOT a type of pipeline hazard?', 'Structural hazard', 'Data hazard', 'Control hazard', 'Memory hazard', 'D', 'The three types of pipeline hazards are: Structural (resource conflicts), Data (data dependencies between instructions), and Control (branch instructions). Memory hazard is not a standard classification.', NULL, 'GATE-inspired', 'Easy'),

('Computer Organization', 'In a 4-stage pipeline, if one stage takes twice as long as others, the throughput is limited by:', 'The first stage', 'The slowest stage', 'The average of all stages', 'The last stage', 'B', 'Pipeline throughput is determined by the bottleneck stage — the slowest stage. The clock cycle must be long enough to accommodate the slowest stage, limiting overall speed.', NULL, 'Practice Question', 'Easy'),

('Computer Organization', 'Which addressing mode is used when the operand is part of the instruction itself?', 'Direct', 'Indirect', 'Immediate', 'Register', 'C', 'Immediate addressing mode embeds the constant operand directly in the instruction. No memory access is needed to fetch the operand, making it the fastest mode.', NULL, 'GATE-inspired', 'Easy'),

('Computer Organization', 'A direct-mapped cache has 16 blocks. Main memory has 512 blocks. How many main memory blocks map to cache block 5?', '16', '32', '512', '8', 'B', 'In direct-mapped cache with 16 cache blocks, memory block b maps to block b mod 16. Blocks 5, 21, 37...501 map to cache block 5 — that is 512/16 = 32 blocks.', NULL, 'GATE PYQ', 'Hard'),

('Computer Organization', 'What is the purpose of the Translation Lookaside Buffer (TLB)?', 'Cache for disk pages', 'Cache for page table entries', 'Replace main memory', 'Store interrupt vectors', 'B', 'The TLB is a small, fast hardware cache that stores recently used page-table entries. It converts virtual-to-physical addresses without accessing main memory for page tables.', 2020, 'GATE PYQ', 'Medium'),

('Computer Organization', 'Out-of-order execution in processors helps primarily to:', 'Reduce power consumption', 'Utilize CPU resources better during stalls', 'Increase clock frequency', 'Reduce instruction count', 'B', 'Out-of-order execution allows the CPU to execute independent instructions while waiting for data from slow memory operations, reducing pipeline stalls and improving throughput.', NULL, 'GATE-inspired', 'Medium'),

('Computer Organization', 'In DMA (Direct Memory Access), the CPU is involved in:', 'Initiating the transfer only', 'Every memory cycle', 'Terminating the transfer only', 'Both initiating and every cycle', 'A', 'In DMA, the CPU initiates the transfer by setting up DMA registers. The DMA controller then takes over and handles the actual data transfer between memory and I/O, interrupting the CPU only upon completion.', NULL, 'GATE-inspired', 'Medium'),

-- Digital Logic
('Digital Logic', 'The minimum number of 2-input NAND gates needed to implement an OR gate is:', '2', '3', '4', '5', 'B', 'OR using NAND: A OR B = (A NAND A) NAND (B NAND B). First NAND A with itself (NOT A), then NAND B with itself (NOT B), then NAND the results. Total: 3 NAND gates.', NULL, 'GATE-inspired', 'Medium'),

('Digital Logic', 'In a JK flip-flop, when J=1 and K=1, the output:', 'Sets to 1', 'Resets to 0', 'Toggles', 'Remains unchanged', 'C', 'When both J and K are 1, the JK flip-flop toggles its output at each clock edge. This eliminates the invalid state of the SR flip-flop where S=R=1.', NULL, 'Practice Question', 'Easy'),

('Digital Logic', 'Which number system uses base-16?', 'Binary', 'Octal', 'Decimal', 'Hexadecimal', 'D', 'Hexadecimal uses base-16 with digits 0-9 and letters A-F. It is widely used in computing to represent binary data compactly (4 bits per hex digit).', NULL, 'Practice Question', 'Easy'),

('Digital Logic', 'The 2''s complement of -5 in 8-bit representation is:', '11111011', '10000101', '11111010', '00000101', 'A', '5 in binary is 00000101. 1''s complement is 11111010. Adding 1 gives 11111011, which is the 2''s complement representation of -5.', NULL, 'GATE-inspired', 'Medium'),

('Digital Logic', 'A full adder has how many inputs?', '1', '2', '3', '4', 'C', 'A full adder has 3 inputs: A, B, and Carry-in (Cin). It produces two outputs: Sum and Carry-out (Cout). This distinguishes it from a half adder which only has 2 inputs.', NULL, 'Practice Question', 'Easy'),

('Digital Logic', 'If A ⊕ B = 0, which of the following must be true?', 'A = 1, B = 0', 'A = 0, B = 1', 'A = B', 'A ≠ B', 'C', 'XOR (⊕) outputs 0 only when both inputs are equal. So A ⊕ B = 0 implies A = B (both 0 or both 1).', NULL, 'GATE-inspired', 'Easy'),

('Digital Logic', 'The Karnaugh map technique is used to:', 'Design sequential circuits', 'Minimize Boolean expressions', 'Design multiplexers', 'Convert binary to gray code', 'B', 'K-maps (Karnaugh maps) are graphical tools for minimizing Boolean expressions by grouping adjacent 1s or 0s. They simplify the process of finding minimal SOP or POS expressions.', NULL, 'Practice Question', 'Easy'),

('Digital Logic', 'A 4-to-1 MUX has how many select lines?', '1', '2', '3', '4', 'B', 'A 4-to-1 multiplexer selects one of 4 inputs. Since 2² = 4, it requires exactly 2 select lines to encode all four input choices.', NULL, 'GATE-inspired', 'Easy'),

('Digital Logic', 'Which of the following expressions represents De Morgan''s theorem?', '(A+B)'' = A''+B''', '(A·B)'' = A''+B''', '(A+B)'' = A''·B''... only', 'Both (A·B)'' = A''+B'' and (A+B)'' = A''·B''', 'D', 'De Morgan''s theorems state: (1) (A·B)'' = A''+B'', the complement of AND is OR of complements; (2) (A+B)'' = A''·B'', complement of OR is AND of complements. Both hold.', 2017, 'GATE PYQ', 'Medium');
