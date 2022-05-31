#include <catch2/catch.hpp>
#include "mathx.h"

TEST_CASE("Example", "[example]")
{
	INFO("Test 1 2 3");
	auto result = addCuda(1, 2);
	REQUIRE(result == 3);
}