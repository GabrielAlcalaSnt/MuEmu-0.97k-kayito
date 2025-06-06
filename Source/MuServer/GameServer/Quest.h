#pragma once

#include "DefaultClassInfo.h"
#include "ProtocolDefines.h"
#include "User.h"

#define MAX_QUEST 500
#define MAX_QUEST_LIST 200
#define MAX_QUEST_BIT_MASK 8

enum eQuestState
{
	QUEST_NORMAL = 0,
	QUEST_ACCEPT = 1,
	QUEST_FINISH = 2,
	QUEST_CANCEL = 3,
};

//**********************************************//
//************ Client -> GameServer ************//
//**********************************************//

struct PMSG_QUEST_STATE_RECV
{
	PBMSG_HEAD header; // C1:A1
	BYTE QuestIndex;
	BYTE QuestState;
};

//**********************************************//
//************ GameServer -> Client ************//
//**********************************************//

struct PMSG_QUEST_INFO_SEND
{
	PBMSG_HEAD header; // C1:A0
	BYTE count;
	BYTE QuestInfo[50];
};

struct PMSG_QUEST_STATE_SEND
{
	PBMSG_HEAD header; // C1:A1
	BYTE QuestIndex;
	BYTE QuestState;
};

struct PMSG_QUEST_RESULT_SEND
{
	PBMSG_HEAD header; // C1:A2
	BYTE QuestIndex;
	BYTE QuestResult;
	BYTE QuestState;
};

struct PMSG_QUEST_REWARD_SEND
{
	PBMSG_HEAD header; // C1:A3
	BYTE index[2];
	BYTE QuestReward;
	BYTE QuestAmount;
#if(GAMESERVER_EXTRA==1)
	DWORD ViewPoint;
#endif
};

//**********************************************//
//**********************************************//
//**********************************************//

struct QUEST_INFO
{
	int Index;
	int MonsterClass;
	int CurrentState;
	int RequireIndex;
	int RequireState;
	int RequireMinLevel;
	int RequireMaxLevel;
	int RequireClass[MAX_CLASS];
};

class CQuest
{
public:

	CQuest();

	~CQuest();

	void Load(char* path);

	void SetInfo(QUEST_INFO info);

	QUEST_INFO* GetInfo(int index);

	QUEST_INFO* GetInfoByIndex(LPOBJ lpObj, int QuestIndex);

	bool AddQuestList(LPOBJ lpObj, int QuestIndex, int QuestState);

	BYTE GetQuestList(LPOBJ lpObj, int QuestIndex);

	bool CheckQuestListState(LPOBJ lpObj, int QuestIndex, int QuestState);

	long GetQuestRewardLevelUpPoint(LPOBJ lpObj);

	bool NpcTalk(LPOBJ lpNpc, LPOBJ lpObj);

	void CGQuestInfoRecv(int aIndex);

	void CGQuestStateRecv(PMSG_QUEST_STATE_RECV* lpMsg, int aIndex);

	void GCQuestInfoSend(int aIndex);

	void GCQuestStateSend(int aIndex, int QuestIndex);

	void GCQuestResultSend(int aIndex, int QuestIndex, int QuestResult, int QuestState);

	void GCQuestRewardSend(int aIndex, int QuestReward, int QuestAmount);

private:

	QUEST_INFO m_QuestInfo[MAX_QUEST];

	int m_count;
};

extern CQuest gQuest;

static const BYTE gQuestBitMask[MAX_QUEST_BIT_MASK] = { 0xFC, 0xFC, 0xF3, 0xF3, 0xCF, 0xCF, 0x3F, 0x3F };