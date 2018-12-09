officesupplies:
  pkg.installed:
    - pkgs:
      - clamav
      - firefox-esr
      - aisleriot
      - libreoffice-common
      - ufw 

/etc/libreoffice/psprint.conf:
  file.managed:
    - source: salt://office/liboff.conf

/etc/firefox-esr/firefox-esr.js:
  file.managed:
    - source: salt://office/homepage.conf

ufw:
  service.enabled


