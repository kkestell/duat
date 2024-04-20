#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

void run_lua_command(lua_State *L, const char *command, const char *path) {
    char lua_script_path[512];

    if (strcmp(command, "build") == 0) {
        snprintf(lua_script_path, sizeof(lua_script_path), "%s/PKG", path);
    } else {
        snprintf(lua_script_path, sizeof(lua_script_path), "%s", path);
    }

    luaL_dofile(L, lua_script_path);
    lua_getglobal(L, command);

    if (lua_isfunction(L, -1)) {
        lua_pushstring(L, path);
        if (lua_pcall(L, 1, 0, 0) != LUA_OK) {
            fprintf(stderr, "Lua error: %s\n", lua_tostring(L, -1));
        }
    } else {
        fprintf(stderr, "Invalid command: %s\n", command);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <command> <path>\n", argv[0]);
        return 1;
    }

    const char *command = argv[1];
    const char *path = argv[2];

    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    if (strcmp(command, "build") == 0 || strcmp(command, "install") == 0) {
        run_lua_command(L, command, path);
    } else {
        fprintf(stderr, "Unknown command: %s\n", command);
    }

    lua_close(L);
    return 0;
}
