# Imaging Local Data Dictionary (LDD)

The Imaging dictionary contains high level classes and attributes used in imaging and spectrometer products.
It also contains classes with attributes used during active mission operations.

Steward: [IMG Node](https://pds-imaging.jpl.nasa.gov/)

Only one LDD source version is kept such that it can be managed by github.

- [src](src)

## Documentation
* **User Guide:** See included file `docs/source/user/user-guide.md` or go to https://pds-data-dictionaries.github.io/ldd-img/
## Versions

A Local Data Dictionary (LDD) is built for selected versions of the [PDS4 Information Model](https://pds.nasa.gov/pds4/doc/im/).
The build process insures compatibility of the LDD with the core information model.

## Builds


This LDD has been released for the following versions of the PDS4 information model:

- [development](build/development)
- [releases](build/release/

## Notes

Each build is generated using the [lddtool](https://pds.nasa.gov/tools/about/ldd/) specific to a version of the [PDS4 Information Model](https://pds.nasa.gov/datastandards/documents/im/). The build command used is:

```
lddtool -lpsnJ PDS4_IMG_IngestLDD.xml
```

# Contribute

Have a bug or feature request? Create one in the [PDS4 Issue Repo](https://github.com/pds-data-dictionaries/PDS4-LDD-Issue-Repo/issues/new/choose).


# Support

See the [PDS Data Dictionaries Support page](https://pds-data-dictionaries.github.io/support/) for more Support information.
