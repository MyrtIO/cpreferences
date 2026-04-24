.PHONY: format
format:
	find src/ include/ -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i
