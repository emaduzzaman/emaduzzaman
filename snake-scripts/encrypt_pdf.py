#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Cross-platform PDF encryption script using pikepdf.
Works on macOS, Linux, and Windows (including WSL).

Usage: run `python3 encrypt_pdf.py` and follow the prompts.
"""

import os
import sys
from getpass import getpass
import pikepdf

def main():
    print("PDF Encryption Tool (pikepdf)")
    print("------------------------------")

    # Get input PDF path
    in_path = input("Enter path to input PDF: ").strip().strip('"').strip("'")
    if not os.path.isfile(in_path):
        print(f"Error: File not found: {in_path}")
        sys.exit(1)

    # Suggest default output filename
    default_out = os.path.splitext(in_path)[0] + "_encrypted.pdf"
    out_path = input(f"Enter output path [{default_out}]: ").strip()
    if not out_path:
        out_path = default_out

    # Ask for passwords
    user_password = getpass("Enter user (open) password: ")
    owner_password = getpass("Enter owner password (can be same or leave empty): ")

    print("\nEncrypting... Please wait...")

    try:
        # AES-128 encryption (R=4). For AES-256, use R=6
        enc = pikepdf.Encryption(user=user_password, owner=owner_password, R=4)

        with pikepdf.open(in_path) as pdf:
            pdf.save(out_path, encryption=enc)

        print(f"\nSuccess! Encrypted PDF saved as: {out_path}")
        print(f"Full path: {os.path.abspath(out_path)}")
    except Exception as e:
        print(f"Error during encryption: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

