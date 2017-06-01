set -e -o pipefail

SBO_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SBO_PATCHDIR}/${PKGNAM}.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.2.0-redhat-modules.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.1.0-notally.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.1.0-console-nochmod.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.2.1-faillock.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.1.6-noflex.patch
patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.1.5-limits-user.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.1.8-full-relro.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.2.0-use-elinks.patch
# Upstreamed partially
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.3.0-pwhistory-helper.patch
patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.1.8-audit-user-mgmt.patch
#patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.2.1-console-devname.patch
patch -p1 -E --backup --verbose -i ${SBO_PATCHDIR}/pam-1.3.0-unix-nomsg.patch


# Set to YES if autogen is needed
SBO_AUTOGEN=YES

set +e +o pipefail
