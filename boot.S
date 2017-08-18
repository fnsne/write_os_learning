.code16
/* Floppy header of FAT12 */
    jmp LABEL_START /* Start to boot */
    nop             /* nop required */

.text
    mov %cs, %ax
    mov %ax, %ds
    mov %ax, %es
    call DispStr
    jmp .

DispStr:
    mov $BootMessage, %ax
    mov %ax, %bp
    mov $16, %cx
    mov $0x1301, %ax
    mov $0x00c, %bx
    mov $0 ,%dl
    int $0x10
    ret

BootMessage:.ascii "Hello, OS world!"
.org 510
.word 0xaa55
