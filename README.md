# CPreferences

`extern "C"` wrappers for Arduino `Preferences.h`.

## Usage

```c
#include <cpreferences.h>

#define NVS_NAMESPACE "config"

typedef struct config_t {
    char ssid[33];
    uint16_t port;
    uint8_t brightness_max;
} config_t;

static config_t config;

void config_load(void) {
	cpreferences_t *prefs = cpreferences_create();
	if (prefs == NULL) {
		return;
	}

	if (!cpreferences_begin(prefs, NVS_NAMESPACE, true)) {
		cpreferences_destroy(prefs);
		return;
	}

	cpreferences_get_string(prefs, "ssid", &config.ssid, 32, "");
	config->port = cpreferences_get_ushort(prefs, "port", 1883);
	config->bright_max = cpreferences_get_uchar(prefs, "bright_max", 255);

	cpreferences_destroy(prefs);
}

void config_save(void) {
	cpreferences_t *prefs = cpreferences_create();
	if (prefs == NULL) {
		return;
	}

	if (!cpreferences_begin(prefs, NVS_NAMESPACE, false)) {
		cpreferences_destroy(prefs);
		return;
	}

	cpreferences_put_string(prefs, "ssid", config->ssid);
	cpreferences_put_ushort(prefs, "port", config.port);
	cpreferences_put_uchar(prefs, "bright_max", 255);

	cpreferences_destroy(prefs);
}
```

## Pico support

For RPi Pico support add `vshymanskyy/Preferences` dependency to project.
