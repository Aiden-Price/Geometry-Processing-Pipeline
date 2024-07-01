#!/usr/bin/env bash

# Searcher Program Test Cases
# Test 1
if ! ./smallest_triangle < /home/tests/searcher_tests/searcher_normal.in | diff -q - /home/tests/searcher_tests/searcher_normal.out
then
    echo "Searcher Test 1 failed"
else
    echo "Searcher Test 1 successful (Normal)"
fi

# Test 2
if ! ./smallest_triangle < /home/tests/searcher_tests/searcher_negative.in | diff -q - /home/tests/searcher_tests/searcher_negative.out
then
    echo "Searcher Test 2 failed"
else
    echo "Searcher Test 2 successful (Negative)"
fi

# Test 3
if ! ./smallest_triangle < /home/tests/searcher_tests/searcher_negative2.in | diff -q - /home/tests/searcher_tests/searcher_negative2.out
then
    echo "Searcher Test 3 failed"
else
    echo "Searcher Test 3 successful (Negative)"
fi

# Test 4
if ! ./smallest_triangle < /home/tests/searcher_tests/searcher_negative3.in | diff -q - /home/tests/searcher_tests/searcher_negative3.out
then
    echo "Searcher Test 4 failed"
else
    echo "Searcher Test 4 successful (Negative)"
fi

# Test 5
if ! ./smallest_triangle < /home/tests/searcher_tests/searcher_edge.in | diff -q - /home/tests/searcher_tests/searcher_edge.out
then
    echo "Searcher Test 5 failed"
else
    echo "Searcher Test 5 successful (Edge)"
fi

# Generator Program Testcases
# Test 1
if ! python3 gen_points.py -N=10 -rseed=3 | diff -q - /home/tests/generator_tests/generator_normal.out
then
    echo "Generator Test 1 failed"
    gen_test1_exit_code=$?
    echo "Generator Test 1 exit code: $gen_test1_exit_code"
else
    echo "Generator Test 1 successful (Normal)"
fi

# Test 2
if ! python3 gen_points.py -rseed=4 -mindist=5 | diff -q - /home/tests/generator_tests/generator_negative.out
then
    echo "Generator Test 2 failed"
    gen_test2_exit_code=$?
    echo "Generator Test 2 exit code: $gen_test2_exit_code"
else
    echo "Generator Test 2 successful (Negative)"
fi

# Test 3
if ! python3 gen_points.py -N=0 -rseed=4 -mindist=5 | diff -q - /home/tests/generator_tests/generator_edge.out
then
    echo "Generator Test 3 failed"
    gen_test3_exit_code=$?
    echo "Generator Test 3 exit code: $gen_test3_exit_code"
else
    echo "Generator Test 3 successful (Edge)"
fi

# Test 4
if ! python3 gen_points.py -N=50 -rseed=4 -mindist=0 | diff -q - /home/tests/generator_tests/generator_corner.out
then
    echo "Generator Test 4 failed"
    gen_test4_exit_code=$?
    echo "Generator Test 4 exit code: $gen_test4_exit_code"
else
    echo "Generator Test 4 successful (Edge)"
fi

# Test 5
if ! python3 gen_points.py -N=2 -rseed=4 -mindist=50 | diff -q - /home/tests/generator_tests/generator_edge_2.out
then
    echo "Generator Test 5 failed"
    gen_test3_exit_code=$?
    echo "Generator Test 5 exit code: $gen_test3_exit_code"
else
    echo "Generator Test 5 successful (Edge)"
fi


# Searcher and Generator Testcases (E2E)
# Test 1
if ! ./smallest_triangle < /home/tests/E2E_tests/ESE_negative_3.args | diff -q - /home/tests/E2E_tests/ESE_negative_3.out
then
    echo "E2E Test 1 failed"
else
    echo "E2E Test 1 successful (Negative)"
fi

# Test 2
if ! ./smallest_triangle < /home/tests/E2E_tests/ESE_edge.args | diff -q - /home/tests/E2E_tests/ESE_edge.out
then
    echo "E2E Test 2 failed"
else
    echo "E2E Test 2 successful (Edge)"
fi

# Test 3
if ! ./smallest_triangle < /home/tests/E2E_tests/ESE_negative.args | diff -q - /home/tests/E2E_tests/ESE_negative.out
then
    echo "E2E Test 3 failed"
else
    echo "E2E Test 3 successful (Negative)"
fi

# Test 4
if ! ./smallest_triangle < /home/tests/E2E_tests/ESE_negative_2.args | diff -q - /home/tests/E2E_tests/ESE_negative_2.out
then
    echo "E2E Test 4 failed"
else
    echo "E2E Test 4 successful (Negative)"
fi

# Test 5
if ! ./smallest_triangle < /home/tests/E2E_tests/ESE_normal.args | diff -q - /home/tests/E2E_tests/ESE_normal.out
then
    echo "E2E Test 5 failed"
else
    echo "E2E Test 5 successful (Normal)"
fi


