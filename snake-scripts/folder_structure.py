import os

def tree(dir_path, prefix=""):
    try:
        # Sort entries and ignore hidden files or .md files
        entries = sorted(
            [e for e in os.listdir(dir_path)
             if not e.startswith('.') and not e.lower().endswith('.md')]
        )
    except PermissionError:
        return

    entries_count = len(entries)
    for index, entry in enumerate(entries):
        path = os.path.join(dir_path, entry)
        connector = "├── " if index < entries_count - 1 else "└── "
        print(prefix + connector + entry + ("/" if os.path.isdir(path) else ""))
        if os.path.isdir(path):
            extension = "│   " if index < entries_count - 1 else "    "
            tree(path, prefix + extension)

if __name__ == "__main__":
    # Set your root folder path
    root_dir = "/mnt/d/emaduzzaman"
    root_name = os.path.basename(root_dir.rstrip("/"))

    print("\n📁 Basic Folder Structure\n")
    print(f"{root_name}/")
    tree(root_dir)
