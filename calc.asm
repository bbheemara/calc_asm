      MOV R8,#msg1
      STR R8,.WriteString
      MOV R9,#msg2
      STR R9,.WriteString
      MOV R10,#msg3
      STR R10,.WriteString
      MOV R11,#msg4
      STR R11,.WriteString
      LDR R0,.InputNum
      CMP R0,#1
      BEQ add
      CMP R0,#2
      BEQ substract
      CMP R0,#3
      BEQ multi
      CMP R0,#4
      BEQ division
      HALT 
add: 
      MOV R0,#msg6
      STR R0,.WriteString
      LDR R0,.InputNum
      MOV R1,#msg10
      STR R1,.WriteString
      LDR R1,.InputNum
      STR R0,var1
      STR R1,var2
      ADD R3,R0,R1
      MOV R4,#msg5 
      STR R4,.WriteString
      MOV R4,#msg5
      STR R4,.WriteString
      STR R3,.WriteSignedNum
      HALT
substract:
      MOV R0,#msg6
      STR R0,.WriteString
      LDR R0,.InputNum 
      MOV R1,#msg11
      STR R1,.WriteString
      LDR R1,.InputNum
      STR R0,var1 
      STR R1,var2
      SUBS R3,R0,R1
      MOV R4,#msg5
      STR R4,.WriteString
      STR R3,.WriteSignedNum
      HALT
multi: 
      MOV R0,#msg6 
      STR R0,.WriteString
      LDR R0,.InputNum 
      MOV R1,#msg12
      STR R1,.WriteString
      LDR R1,.InputNum 
      STR R0,var1 
      STR R1,var2 
      MOV R4,#0 
      CMP R0,#0 
      BGT skip_neg0 
      MOV R5,#0
      SUB R0,R5,R0 
      EOR R4,R4,#1 
skip_neg0: 
      CMP R1,#0 
      BGT skip_neg1    
      MOV R5,#0
      SUB R1,R5,R1 
      EOR R4,R4,#1 
skip_neg1:
      MOV R3,#0 
      CMP R1,#0 
      BEQ mult_done    
mul_loop:
      ADD R3,R3,R0      
      SUB R1,R1,#1      
      CMP R1,#0 
      BGT mul_loop      
mult_done:
      CMP R4,#0 
      BEQ mult_print 
      MOV R5,#0 
      SUB R3,R5,R3 
mult_print:
      MOV R4,#msg5
      STR R4,.WriteString
      STR R3,.WriteSignedNum
      HALT
division:
      LDR R0,.InputNum
      LDR R1,.InputNum
      STR R0,var1
      STR R1,var2
loop_div: 
      CMP R0,R1
      BLT done_div
      SUB R0,R0,R1
      ADD R2,R2,#1
      B loop_div
done_div:
      MOV R4,#msg5
      STR R4,.WriteString
      STR R2,.WriteSignedNum
      HALT
var1: .WORD 0 
var2: .WORD 0
msg:  .ASCIZ "Hello!"
msg1: .ASCIZ "Type 1 for Addition"
msg2: .ASCIZ "\nType 2 for Substraction"
msg3: .ASCIZ "\nType 3 for Multiplication"
msg4: .ASCIZ "\nType 4 for Division"
msg5: .ASCIZ "\n\n\n\nAns:\n"
msg6: .ASCIZ "\n\n\n\nEnter a number below\n"
msg7: .ASCIZ "\n\n\n\nEnter a number below\n"
msg8: .ASCIZ "\n\n\n\nEnter a number below\n"
msg9: .ASCIZ "\n\n\n\nEnter a number below\n"
msg10: .ASCIZ "\n\n\n\nEnter another number want to Add\n"
msg11: .ASCIZ "\n\n\n\nEnter another  number want to Substract\n"
msg12: .ASCIZ "\n\n\n\nEnter another  number want to Multilpy\n"
msg13: .ASCIZ "\n\n\n\nEnter another  number want to Divide\n"
