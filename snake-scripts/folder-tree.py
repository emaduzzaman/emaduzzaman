import os

def tree(dir_path, prefix=""):
    try:
        # List ONLY non-hidden directories
        entries = sorted(
            e for e in os.listdir(dir_path)
            if not e.startswith('.') and os.path.isdir(os.path.join(dir_path, e))
        )
    except PermissionError:
        print(prefix + "└── [Permission Denied]")
        return

    entries_count = len(entries)

    for index, entry in enumerate(entries):
        path = os.path.join(dir_path, entry)
        connector = "├── " if index < entries_count - 1 else "└── "
        print(prefix + connector + entry + "/")

        extension = "│   " if index < entries_count - 1 else "    "
        tree(path, prefix + extension)


def choose_directory():
    while True:
        dir_path = input("\n📂 Enter directory path (or press Enter to exit): ").strip()

        if dir_path == "":
            return None

        if os.path.isdir(dir_path):
            return os.path.abspath(dir_path)

        print("⚠️ Invalid directory. Please try again.")


if __name__ == "__main__":
    print("\n📁 Folder Tree Viewer (Folders Only)\n")

    root_dir = choose_directory()
    if not root_dir:
        print("👋 Exiting.")
        exit()

    root_name = os.path.basename(root_dir.rstrip("/"))
    print(f"\n{root_name}/")
    tree(root_dir)

