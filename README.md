# Arduino Processing Container Image

This container image combines Arduino and Processing to make CI workflows easier.
- arduino-cli v0.34.1
  - Cores:
    - arduino:samd
    - sparkfun:samd
    - adafruit:samd
    - teensy:avr
  - Libraries:
    - elapsedMillis
- processing v4.3
  - Libraries:
    - controlp5