# Imaging Local Data Dictionary (LDD)

The Imaging dictionary contains high level classes and attributes used in imaging and spectrometer products.
It also contains classes with attributes used during active mission operations.

Steward: [IMG Node](https://pds-imaging.jpl.nasa.gov/)

Only one LDD source version is kept such that it can be managed by github.

- [src](src) for PDS4 version 1.F.0.0, 1.G.0.0, 1.H.0.0

## Versions

A Local Data Dictionary (LDD) is built for selected versions of the [PDS4 Information Model](https://pds.nasa.gov/pds4/doc/im/).
The build process insures compatiblity of the LDD with the core information model.

## Builds


This LDD has been released for the following versions of the PDS4 information model:

- [development](build/development)
- [PDS4 IM v1.H.0.0 (IMG LDD v1.8.5.0)](build/release/1.16.0.0)
- [PDS4 IM v1.F.0.0 (IMG LDD v1.8.1.0)](build/release/1.15.0.0)
- [PDS4 IM v1.E.0.0 (IMG LDD v1.8.1.0)](build/release/1.14.0.0)
- [PDS4 IM v1.D.0.0 (IMG LDD v1.7.3.0)](build/release/1.D.0.0_1.7.3.0)
- [PDS4 IM v1.B.0.0 (IMG LDD v1.6.1.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.6.1.0)
- [PDS4 IM v1.A.1.0 (IMG LDD v1.5.1.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.5.1.0)
- [PDS4 IM v1.9.0.0 (IMG LDD v1.3.0.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.3.0.0)
- [PDS4 IM v1.1.0.0 (IMG LDD v1.1.0.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.1.0.0)


## Notes

Each build is generated using the [lddtool](https://pds.nasa.gov/tools/about/ldd/) specific to a version of the [PDS4 Information Model](https://pds.nasa.gov/datastandards/documents/im/). The build command used is:

```
lddtool -lpsnJ PDS4_IMG_IngestLDD.xml
```

# Contribute

Have a bug or feature request? Create one in the [PDS4 Issue Repo](https://github.com/pds-data-dictionaries/PDS4-LDD-Issue-Repo/issues/new/choose).


# Support

See the [PDS Data Dictionaries Support page](https://pds-data-dictionaries.github.io/support/) for more Support information.
