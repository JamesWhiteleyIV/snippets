## Some good references for figuring things out:

-  [USD Interest Group](https://groups.google.com/g/usd-interest/)
    - A forum with quick answers from people who are probably the most knowledgeable on USD on earth.
- [USD Cookbook](https://github.com/ColinKennedy/USD-Cookbook)
    - This guy has a ton of examples and is active on usd interest group.
- [Official C++ Docs](https://graphics.pixar.com/usd/docs/api/)
    - Official C++ docs
- [Python Beginner Guide](https://graphics.pixar.com/usd/docs/)
    - Beginner guides and basic how-to guides via python

## How to build USD (shared library with .dll's and .lib's)

- clone Pixar's USD repo
	```bash
	git clone https://github.com/PixarAnimationStudios/USD.git
	```
- ensure only ONE version of python is installed on your machine (can create a virtual machine instead or uninstall other versions, I used python 3.7.7 for all my builds since this is what Unreal 4.26 uses - but I do not think it matters for static lib build of USD).
- ensure Jinja2 is installed for your version of python
	```bash
	python -m pip install Jinja2
	```
- Launch "x64 Native Tools Command Prompt" for your version of Visual Studio
- run the build script with any options you may want (see Pixar USD repo for flags - note that some won't work with static lib build). The following command is what I used, which doesn't build usdview (it requires some PySide stuff and I didn't need it so I didn't deal with it).
	```bash
	python /path/to/USD/build_scripts/build_usd.py "path/to/where/you/want/USD_build" --no-usdview --no-imaging
	```
- To use the pxr python module:
    - Add the following in your PYTHONPATH environment variable:
        - /path/to/USD_build/lib/python
    - Add the following in your PATH environment variable:
        - /path/to/USD_build/bin
        - /path/to/USD_build/lib

## How to build USD (static library with only .lib's)

- NOTE: static lib build will NOT have python and will NOT have the ability to add custom usd schemas/plugins.
- clone Pixar's USD repo
	```bash
	git clone https://github.com/PixarAnimationStudios/USD.git
	```
- ensure only ONE version of python is installed on your machine (can create a virtual machine instead or uninstall other versions, I used python 3.7.7 for all my builds since this is what Unreal 4.26 uses - but I do not think it matters for static lib build of USD).
- ensure Jinja2 is installed for your version of python
	```bash
	python -m pip install Jinja2
	```
- Launch "x64 Native Tools Command Prompt" for your version of Visual Studio
- copy the custom build script to /path/to/USD/build\_scripts/ folder (it just changes one line from the original build script, on line 1379 sets DBUILD\_SHARED_LIBS=OFF instead of ON).
- run the custom build script with any options you may want (see Pixar USD repo for flags - note that some won't work with static lib build). The following command is what I used, which doesn't build usdview (it requires some PySide stuff and I didn't need it so I didn't deal with it).
	```bash
	python /path/to/USD/build_scripts/build_usd_static.py "path/to/where/you/want/USD_build" --no-usdview --no-imaging
	```

## How to create a new USD Schema

- Official docs:  https://graphics.pixar.com/usd/docs/Generating-New-Schema-Classes.html
- NOTE: this requires you to have build USD into a shared library, and had Jinja2 module installed via pip for your python you used to build, so that usdGenSchema cmd to work.
- Ensure you have your paths setup properly:
    - Add the following in your PYTHONPATH environment variable:
        - /path/to/USD_build/lib/python
    - Add the following in your PATH environment variable:
        - /path/to/USD_build/bin
        - /path/to/USD_build/lib
- Create a schema.usda file (see examples in official docs and here: {USD_Repo}/extras/usd/examples/usdSchemaExamples )
- Run usdGenSchema cmd on schema.usda, this will generate cpp/h files among others (NOTE: the "." at the end):
	```bash
	{USD_Build}/bin/usdGenSchema schema.usda .
	```
- Copy the following files to the same folder as your schema.usda and modify them for your plugin (they don't get generated and are needed to create python bindings - the pxr docs do not really tell you this and it took a lot of digging to figure out).
    - USD\\extras\\usd\\examples\\usdSchemaExamples\\CMakeLists.txt
    - USD\\extras\\usd\\examples\\usdSchemaExamples\\module.cpp
    - USD\\extras\\usd\\examples\\usdSchemaExamples\\moduleDeps.cpp
    - USD\\extras\\usd\\examples\\usdSchemaExamples_*init*_.py
- I didn't get to the following step since I was using a static lib and had to scrap the idea for time being, but it looks like you build and use the schema as follows:
    - Build plugin using cmake:
     ```bash
   cmake --build . --target install --config Release
   ```
    - Because this schema is an external plugin, the USD build must be told where to find it before it can be used. This can be done by either:
        - Setting the PXR\_PLUGINPATH\_NAME environment variable to the location of the plugin's resources directory. For example, if you are building the usdSchemaExamples plugin out of the USD source tree, this location will be /share/usd/examples/plugin/usdSchemaExamples/resources
        - Copying usdSchemaExamples.so (on Windows, usdSchemaExamples.dll and .lib) and the usdSchemaExamples directory to /plugin/usd
