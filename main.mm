#define noinline __attribute__((noinline))

typedef struct Frame {
	Frame *next;
	uint32_t offset;
} Frame;

noinline int A();
noinline int B();

void stack() {
 	volatile Frame *frame = 0;
	asm("mov %0, r7\n" : "=r"(frame));
	while (frame) {
		printf("%x\n", frame->offset);
		frame = frame->next;
	}
	printf("%p-%p\n", A, B);
}

noinline int A() {
	int x = time(NULL);
	x *= 2;
	return x << B();
}

noinline int B() {
	stack();
	return 33 << rand();
}

int main() {
	A();
}
