@@@ ----------------------------------------------------------
@@@ function wl_quicksort(wln **left,wln **right) quicksorts
@@@ the array of pointers in order of the word counts
@@@ On the first call to this function, left should point to the
@@@ first item (beginning of the array of pointers), and right
@@@ should point to the last item pointer in the array of pointers.
wl_quicksort:
	        cmp     r0,r1
	        movge   pc,lr           @ return if length<=1
	        stmfd   sp!,{r4-r7,lr}
	        ldr     r12,[r0]        @ use count of first item as
	        ldr     r12,[r12,#wln_count] @ pivot value in r12
	        mov     r4,r0           @ current left
	        mov     r5,r1           @ current right
	        mov     r6,r0           @ original left(first)
	        mov     r7,r1           @ original right(last)
loopa: 		cmp     r4,r5           @ while left <= right &&
        	bgt     finale
	        ldr     r0,[r4]         @ (*left)->count > pivot
        	ldr     r1,[r0,#wln_count]
        	cmp     r1,r12
        	ble     loopb
        	add     r4,r4,#4        @ increment left
        	b       loopa
loopb: 		cmp     r4,r5           @ while left < right &&
	        bgt     finale
	        ldr     r2,[r5]         @ (*right)->count < pivot
	        ldr     r3,[r2,#wln_count]
	        cmp     r3,r12
	        bge     cmp
	        sub     r5,r5,#4        @ decrement right
	        b       loopb
cmp: 		  cmp     r4,r5           @ if( left <= right )
	        bgt     finale
	        str     r0,[r5],#-4     @ swap pointers and
	        str     r2,[r4],#4      @ change indices
	        b       loopa
finale: 	mov     r0,r6           @ quicksort array from
	        mov     r1,r5           @ first to current right
	        bl      wl_quicksort
	        mov     r0,r4           @ quicksort array from
	        mov     r1,r7           @ current left to last)
	        bl      wl_quicksort
	        ldmfd   sp!,{r4-r7,pc}
