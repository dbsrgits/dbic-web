INSTALL_DIR		:= /var/www/dbix-class.org/DBIC-Web/pages
STATIC_DIR		:= assets
OWNER			:= dpetrov
GROUP			:= dpetrov
TT_DIR			:= pages
TEMPLATES		:= index about team download documentation support

all: build

build:
	@echo: "Use 'make install' to install DBIC website"

install:
	rm -rf $(INSTALL_DIR)
	mkdir -p $(INSTALL_DIR)
	@for TEMPLATE in $(TEMPLATES); do \
		echo "ttpage ${TT_DIR}/$${TEMPLATE}.tt"; \
		tpage --include_path ${TT_DIR} --define active_page="$${TEMPLATE}" $${TEMPLATE}.tt > ${INSTALL_DIR}/$${TEMPLATE}.html; \
	done
	lessc assets/less/application.less > assets/css/application.css
	cp -rf $(STATIC_DIR) $(INSTALL_DIR)/
	chown -R $(OWNER):$(GROUP) $(INSTALL_DIR)/
