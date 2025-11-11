import os

def tree(dir_path, prefix=""):
    try:
        # Sort entries and ignore hidden files or .md files
        entries = sorted(
            [e for e in os.listdir(dir_path)
             if not e.startswith('.') and not e.lower().endswith('.md')]
        )
    except PermissionError:
        return []

    entries_count = len(entries)
    for index, entry in enumerate(entries):
        path = os.path.join(dir_path, entry)
        connector = "├── " if index < entries_count - 1 else "└── "
        print(prefix + connector + entry + ("/" if os.path.isdir(path) else ""))
        if os.path.isdir(path):
            extension = "│   " if index < entries_count - 1 else "    "
            tree(path, prefix + extension)
    return entries

def choose_folder(dir_path):
    # List top-level folders
    folders = [f for f in os.listdir(dir_path) if os.path.isdir(os.path.join(dir_path, f)) and not f.startswith('.')]
    if not folders:
        print("⚠️ No folders available to choose from!")
        return None

    print("\n📂 Select a folder to view its structure:")
    for i, f in enumerate(folders, start=1):
        print(f"  {i}: {f}/")

    try:
        choice = int(input("Enter number of folder (or 0 to exit): "))
        if choice == 0:
            return None
        selected_folder = folders[choice - 1]
        return os.path.join(dir_path, selected_folder)
    except (ValueError, IndexError):
        print("⚠️ Invalid input. Try again.")
        return choose_folder(dir_path)

if __name__ == "__main__":
    root_dir = "/mnt/d/emaduzzaman"
    root_name = os.path.basename(root_dir.rstrip("/"))

    print("\n📁 Basic Folder Structure\n")
    print(f"{root_name}/")
    tree(root_dir)

    while True:
        folder_path = choose_folder(root_dir)
        if not folder_path:
            print("\n👋 Exiting. Goodbye!")
            break
        print(f"\n📁 Detailed Structure of '{os.path.basename(folder_path)}'\n")
        print(f"{os.path.basename(folder_path)}/")
        tree(folder_path)
