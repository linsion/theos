internal-install:: internal-install-check
	$(ECHO_INSTALLING)install.exec "cat > /tmp/_theos_install.pkg; $(THEOS_SUDO_COMMAND) sudo installer -pkg /tmp/_theos_install.pkg && rm /tmp/_theos_install.pkg" < "$(_THEOS_PACKAGE_LAST_FILENAME)"$(ECHO_END)

internal-uninstall::
	$(ECHO_NOTHING)install.exec "pkgutil --files \"$(THEOS_PACKAGE_NAME)\" | tail -r | sed 's/^/\//' | sudo xargs rm -d; $(THEOS_SUDO_COMMAND) pkgutil --forget \"$(THEOS_PACKAGE_NAME)\""$(ECHO_END)
