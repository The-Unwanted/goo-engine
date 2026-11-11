/* SPDX-License-Identifier: GPL-2.0-or-later */

/*
 * Compatibility force-include for building Goo Engine (Blender 4.1 sources)
 * with recent MSVC toolchains (Visual Studio 2022 17.10 / MSVC 19.40 and newer).
 *
 * Newer MSVC standard library headers no longer pull some headers in
 * transitively the way they used to when 4.1 was released. Sources that relied
 * on that (e.g. intern/cycles/util/profiling.cpp using std::chrono without
 * including <chrono>, or files using uint64_t without <cstdint>) then fail with
 * C2039 / C3861 / "identifier not found" errors.
 *
 * The build injects this header with `/FI` so every translation unit sees the
 * headers it implicitly relied on. It is intentionally C safe: C sources get
 * nothing at all, only C++ sources are affected.
 *
 * Remove once the tree is updated to include these headers explicitly.
 */

#ifdef __cplusplus
#  include <cstdint>
#  include <cstring>
#  include <chrono>
#  include <thread>
#endif
