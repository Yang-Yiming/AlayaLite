#!/bin/bash
set +e
# 参数设置

SCRIPT_DIR=$(dirname "$(realpath "$0")")
BUILD_DIR="${SCRIPT_DIR}/../build"
BIN_DIR="${BUILD_DIR}/bin"  # 可执行文件目录
TEST_DIR="${BUILD_DIR}/tests"
REPORT_DIR="${BUILD_DIR}/coverage"
mkdir -p "${REPORT_DIR}"

# find "$BIN_DIR" -type f -executable -exec {} \;

find "$TEST_DIR" -type f \( -name "*.gcno" -o -name "*.gcda" \) -exec cp {} "${REPORT_DIR}" \;

# # You need to modify /usr/bin/gcov-13 to your own path
lcov --gcov-tool /usr/bin/gcov-13 --capture --directory "${REPORT_DIR}" --output-file "${REPORT_DIR}/coverage.info"

lcov --remove "${REPORT_DIR}/coverage.info"  '*/_deps/*' '*/13/*' -o "${REPORT_DIR}/coverage_filtered.info"

genhtml "${REPORT_DIR}/coverage_filtered.info" --output-directory "${REPORT_DIR}/coverage_filtered_report"

