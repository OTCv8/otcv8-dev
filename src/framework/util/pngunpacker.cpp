#include "pngunpacker.h"

FileMetadata::FileMetadata(std::istream& istr)
{
	/* Read offset */
	istr.read(reinterpret_cast<char*>(&offset), sizeof(uint32_t));

	/* Read file size */
	istr.read(reinterpret_cast<char*>(&fileSize), sizeof(uint32_t));

	/* Read filename length */
	uint16_t filenameLen = 0;
	istr.read(reinterpret_cast<char*>(&filenameLen), sizeof(uint16_t));

	/* Read file name */
	fileName.resize(filenameLen);
	istr.read(const_cast<char*>(fileName.data()), filenameLen);
}

bool PngUnpacker::unpackFiles()
{
	packedFileData.clear();
	metadata.clear();

	if (fileContent.size() == 0) {
		g_logger.error(stdext::format("Failed to load sprites from - no files"));
		return false;
	}

	std::stringstream packedDataSS(std::move(fileContent));

	/* Read entry count */
	uint32_t entryCount = 0;
	packedDataSS.read(reinterpret_cast<char*>(&entryCount), sizeof(uint32_t));

	if (entryCount == 0) {
		g_logger.error(stdext::format("Failed to load sprites - no files"));
		return false;
	}

	metadata.reserve(entryCount);
	for (uint32_t i = 0; i < entryCount; ++i) {
		metadata.emplace_back(packedDataSS);
	}

	/* Read packed files data */
	std::streamsize currPos = packedDataSS.tellg();
	std::streamsize bytesLeft = fileContent.size() - currPos;
	packedFileData.resize(bytesLeft);

	packedDataSS.read(packedFileData.data(), packedFileData.size());
	return true;
}