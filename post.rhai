let project_name = variable::get("project-name");
let crate_type = variable::get("crate_type");

file::rename("include/lib/lib.h", `include/lib/${project_name}.h`);
file::rename("include/lib", `include/${project_name}`);
file::write("README.md", "");

if crate_type == "lib" {
  file::delete("src/main.cpp")
} else {
  file::delete("src/lib.cpp")
}
