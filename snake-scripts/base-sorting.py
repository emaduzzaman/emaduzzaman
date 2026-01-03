import os
from zipfile import ZipFile

def merge_sort(lines):
sorted_data = {}

```
for line in lines:
    parts = line.strip().split('\\t')  # Ensure tab-delimited parsing
    if len(parts) < 3:
        continue  # Skip malformed lines

    msisdn, district, usage = parts[0], parts[1].strip(), parts[2].strip()
    msisdn_with_880 = f'880{msisdn}'
    district = district.replace(" ", "_").lower()

    if district not in sorted_data:
        sorted_data[district] = []

    sorted_data[district].append(msisdn_with_880)

for district in sorted_data:
    sorted_data[district].sort()

return sorted_data

```

def main():
input_file = '/Users/kaziemaduzzamangelani/Documents/Study Folder/Data Analysis - learning/Banglalink/Main folder/Base.txt'  # Change path if needed
output_dir = '/Users/kaziemaduzzamangelani/Desktop/output_files'  # Directory to store sorted files
zip_filename = '/Users/kaziemaduzzamangelani/Desktop/all_district_numbers.zip'

```
os.makedirs(output_dir, exist_ok=True)  # Ensure output directory exists

with open(input_file, 'r', encoding='utf-8') as file:
    lines = file.readlines()

district_data = merge_sort(lines)

for district, msisdn_list in district_data.items():
    with open(os.path.join(output_dir, f'{district}.txt'), 'w', encoding='utf-8') as file:
        file.write('\\n'.join(msisdn_list))

with ZipFile(zip_filename, 'w') as zip_file:
    for file in os.listdir(output_dir):
        file_path = os.path.join(output_dir, file)
        zip_file.write(file_path, os.path.basename(file_path))

print(f'Files saved in {output_dir} and zipped as {zip_filename}')

```

if **name** == "**main**":
main()