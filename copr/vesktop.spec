Name:           vesktop
Version: 1.5.8
Release:        1%{?dist}

%define debug_package       %{nil}
%define debugsource_package %{nil}
Summary:        Electron-based Discord client with Vencord tweaks
License:        GPL 3.0
URL:            https://vencord.dev
ExclusiveArch:  x86_64 aarch64

Source0:        vesktop-%{version}.x86_64.rpm
Source1:        vesktop-%{version}.aarch64.rpm


%description
Vesktop repackaged for Fedora via Copr.  Upstream binaries,
no code changes.

%prep
%setup -qcT    # create %%_builddir but do nothing else

%build

%install
# Unpack only the matching arch’s RPM:
%ifarch x86_64
rpm2cpio %{SOURCE0} | cpio -idm --quiet
%endif
%ifarch aarch64
rpm2cpio %{SOURCE1} | cpio -idm --quiet
%endif

mkdir -p %{buildroot}/
cp -a opt usr %{buildroot}/

%files
/opt
/usr

%changelog
* Thu Jul 10 2025 You <whayn@whayn.com> - %{version}-1
- Initial import of upstream Vesktop binary
