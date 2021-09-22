#ifndef __PNG_UNPACKER_H
#define __PNG_UNPACKER_H

#include <framework/core/declarations.h>
#include <framework/graphics/declarations.h>

 /* File unpacking related */
class FileMetadata
{
public:
	FileMetadata(std::istream& istr);

	const std::string& getFileName() const { return fileName; }
	uint32_t getOffset() const { return offset; }
	uint32_t getFileSize() const { return fileSize; }
private:
	std::string fileName;
	uint32_t offset = 0;
	uint32_t fileSize = 0;
};

class PngUnpacker
{
public:
	PngUnpacker(std::string fileContent) :
		fileContent(std::move(fileContent))
	{}

	bool unpackFiles();

	const std::vector<char>& getPackedFileData() const { return packedFileData; }
	const std::vector<FileMetadata>& getMetadata() const { return metadata; }
private:
	std::string fileContent;
	std::vector<char> packedFileData;
	std::vector<FileMetadata> metadata;
};

#endif