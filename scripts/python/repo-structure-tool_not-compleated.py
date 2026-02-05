import os

def print_title(repo_name):
    print(f"\n📁 Basic Folder Structure – {repo_name} Repository\n")

def tree(dir_path, prefix="", show_files=True, level=0):
    entries = sorted(
        [e for e in os.listdir(dir_path)
         if not e.startswith('.') and not e.lower().endswith('.md')]
    )
    entries_count = len(entries)

    for index, entry in enumerate(entries):
        path = os.path.join(dir_path, entry)
        connector = "├── " if index < entries_count - 1 else "└── "
        print(prefix + connector + entry + ("/" if os.path.isdir(path) else ""))
        if os.path.isdir(path) and show_files:
            extension = "│   " if index < entries_count - 1 else "    "
            tree(path, prefix + extension, show_files, level + 1)

def search_files(base_dir, keyword):
    print(f"\n🔍 Searching for '{keyword}' in {base_dir}...\n")
    matches = []
    for root, _, files in os.walk(base_dir):
        for f in files:
            if keyword.lower() in f.lower():
                matches.append(os.path.join(root, f))
    if matches:
        print("✅ Matches found:\n")
        for m in matches:
            print(f"- {os.path.basename(m)}  ({m})")
    else:
        print("❌ No matches found.")

def main():
    root_dir = "/mnt/d/emaduzzaman"
    repo_name = os.path.basename(root_dir.rstrip("/"))

    # Step 1: Print title and top-level structure
    print_title(repo_name)
    print(f"{repo_name}/")
    entries = [e for e in os.listdir(root_dir)
               if os.path.isdir(os.path.join(root_dir, e)) and not e.startswith('.')]
    entries_count = len(entries)
    for index, entry in enumerate(entries):
        connector = "├── " if index < entries_count - 1 else "└── "
        print(connector + entry + "/")

    # Step 2: Ask which folder to explore
    while True:
        folder = input("\n📂 Enter folder name to explore in detail (or 'exit' to quit): ").strip()
        if folder.lower() == "exit":
            print("\n👋 Exiting. Have a great day!")
            break
        folder_path = os.path.join(root_dir, folder)
        if os.path.isdir(folder_path):
            print(f"\n📁 Detailed Structure of '{folder}'\n")
            print(f"{folder}/")
            tree(folder_path)
        else:
            print("⚠️ Folder not found. Try again.")

        # Step 3: Ask for search option
        search = input("\n🔍 Would you like to search for a specific file (y/n)? ").strip().lower()
        if search == 'y':
            keyword = input("Enter keyword to search: ").strip()
            search_files(root_dir, keyword)

        again = input("\n↩️ Would you like to explore another folder or search again (y/n)? ").strip().lower()
        if again != 'y':
            print("\n✅ Task completed. Goodbye!")
            break

if __name__ == "__main__":
    main()
