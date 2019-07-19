# Imaging Local Data Dictionary (LDD)

The Imaging dictionary contains high level classes and attributes used in imaging and spectrometer products.
It also contains classes with attributes used during active mission operations.

Steward: [IMG Node](https://pds-imaging.jpl.nasa.gov/)

## Released Versions

A Local Data Dictionary (LDD) is built for each version of the [PDS4 Information Model](https://pds.nasa.gov/datastandards/documents/im/).
The build process ensures compatibility of the LDD with the core information model.

This LDD has been released for the following versions of the PDS4 information model:

- [PDS4 IM v1.11.0.0 (IMG LDD v1.6.1.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.6.1.0)
- [PDS4 IM v1.11.0.0 (IMG LDD v1.6.0.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.6.0.0)
- [PDS4 IM v1.10.1.0 (IMG LDD v1.5.1.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.5.1.0)
- [PDS4 IM v1.9.0.0 (IMG LDD v1.3.0.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.3.0.0)
- [PDS4 IM v1.1.0.0 (IMG LDD v1.1.0.0)](https://github.com/nasa-pds-data-dictionaries/ldd-img/releases/tag/v1.1.0.0)


## Notes

Each build is generated using the [lddtool](https://pds.nasa.gov/tools/about/ldd/) specific to a version of the [PDS4 Information Model](https://pds.nasa.gov/datastandards/documents/im/). The build command used is:

```
lddtool -lpsnJ ldd-file.xml
```
