export type OptionKey = "A" | "B" | "C" | "D";

export interface MCQ {
  /** Question number (e.g. 1–241) */
  id: number;
  /** Optional batch or group number (e.g. 1, 2) */
  batch?: number;
  /** Optional topic tag (e.g. "Cache", "Pipeline") */
  topic?: string;
  /** Full question text */
  question: string;
  /** Four options labelled A–D */
  options: Record<OptionKey, string>;
  /** Letter of the correct option */
  correctOption: OptionKey;
  /** Exam-style explanation */
  explanation: string;
  /** Optional source label (e.g. "COA Batch 2") */
  source?: string;
}

export type MCQSet = MCQ[];

