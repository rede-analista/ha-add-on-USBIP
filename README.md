# ha-add-onUSBIP
 Add-on to run USBIP server

# USBIP Client Add-on for Home Assistant

## Description

This add-on allows Home Assistant to connect to remote USBIP servers and monitor multiple UPS devices.

## Installation

1. Copy the `usbip_addon` directory to your Home Assistant add-ons directory.
2. Go to `Supervisor` > `Add-on Store`.
3. Click on the three dots in the upper right corner and select `Repositories`.
4. Add the URL of this GitHub repository.
5. Install the USBIP Client add-on.

## Configuration

Example configuration:

```json
{
  "devices": [
    {
      "name": "Device1",
      "host": "192.168.1.100",
      "bus_id": "1-1"
    },
    {
      "name": "Device2",
      "host": "192.168.1.101",
      "bus_id": "1-2"
    }
  ]
}
