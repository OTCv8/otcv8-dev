#ifndef __PNG_UNPACKER_H
#define __PNG_UNPACKER_H

#include <framework/core/declarations.h>
#include <framework/core/filestream.h>
#include <framework/graphics/declarations.h>

 /* File unpacking related */
class FileMetadata
{
public:
	FileMetadata(const FileStreamPtr& file);

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
	static std::unordered_map<uint32_t, std::string> unpack(const FileStreamPtr& file);
};

#endif
