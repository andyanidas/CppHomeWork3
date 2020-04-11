/* @Author
Student Name: Lkhagva-Erdene
Student ID: 040100923
Date: 20.12.2019 */

#include<iostream>
#include<fstream>
#include<string>
#include<stdlib.h>
#define max 100
//structs
struct BS;
struct MH {
	int id;
	BS *parent;
	MH *next;
};
struct BS {
	int id;
	BS *next;
	BS *parent;
	BS *child;
	MH *hosts;
};

using namespace std;


//prototypes
struct BS *newBS(int id);
struct MH *newMH(int id);
struct BS findBS(int pId, BS *root);
void add_BS(int id, int pId, BS *root);
void add_MH(int id, int pId, BS *root);
void msgDeliver(int target, string sms, BS *root);

bool found = false;
void printPath(BS *root);

int main(int argc, char *argv[]){
	//reading file Network.txt
	fstream network;
	network.open(argv[1]);
	cout<<*argv<<endl;
	string in;
	if (!network.is_open()){
		cerr << "File could not opened!" << endl;
		system("pause");
		exit(1);
	}

	BS *root = newBS(0);
	BS *current;
	current = root;
	int id, parentId;

	while (network >> in){
		if (in == "BS"){//adding Base Stations
			network >> id;
			network >> parentId;
			add_BS(id, parentId, current);
		}
		else if (in == "MH"){//adding Mobile Hosts
			network >> id;
			network >> parentId;
			add_MH(id, parentId, current);
		}
	}
	network.close();
	//-----Reading Message.txt file

	fstream message;
	message.open(argv[2]);
	if (!message.is_open()){
		cerr << "File could not be opened." << endl;
		exit(1);
	}
	string line;
	int target, count = 0;
	getline(message, line);
	while (!message.eof()){
		string messagePart = line.substr(0, line.find(">"));
		target = atoi(line.substr(messagePart.size() + 1, line.find("0")).c_str());
		cout << "Traversing:";
		msgDeliver(target, messagePart, root);
		if (!found){
			cout <<endl<< "Can not be reached the mobile host mh_" << target << " at the moment" << endl;
		}
		found = false;
		getline(message, line);
		message.ignore(); //in the give file Messages.txt there was an new line at the end of the file, to get rid of that new line this line is added!
	}
	message.close();
	return 0;
}

struct BS *newBS(int id){
	BS *newBS = new BS;
	newBS->id = id;
	newBS->next = NULL;
	newBS->parent = NULL;
	newBS->child = NULL;
	newBS->hosts = NULL;
	return newBS;
}
struct MH *newMH(int id){
	MH *newMH = new MH;
	newMH->id = id;
	newMH->parent = NULL;
	newMH->next = NULL;
	return newMH;
}

void add_BS(int id, int pId, BS *trav){//Base Station adding function
	BS *temp = newBS(id);
	if (trav->id == pId){
		if (!trav->child){
			trav->child = temp;
			temp->parent = trav;
		}
		else{
			trav = trav->child;
			while (trav->next){
				trav = trav->next;
			}
			trav->next = temp;
			temp->parent = trav->parent;
		}

		return;
	}
	if (trav->child != NULL){
		add_BS(id, pId, trav->child);
	}
	if (trav->next != NULL){
		add_BS(id, pId, trav->next);
	}
}
void add_MH(int id, int pId, BS *trav){//Mobile Host Adding Function

	if (trav->id == pId){
		if (!trav->hosts){
			trav->hosts = newMH(id);
			trav->hosts->parent = trav;
		}
		else{
			MH *temp;
			temp = trav->hosts;
			while (temp->next){
				temp = temp->next;
			}
			temp->next = newMH(id);
			temp->next->parent = temp->parent;
		}

		return;
	}
	if (trav->child != NULL){
		add_MH(id, pId, trav->child);
	}
	if (trav->next != NULL){
		add_MH(id, pId, trav->next);
	}
}


void msgDeliver(int target, string sms, BS *root){ //finding the host and delivering the message
	static int count = 0;
	if (root == NULL || found){
		return;
	}
	cout << root->id << " ";
	if (root->hosts){

		MH *temp;
		temp = root->hosts;
		while (temp){
			if (temp->id == target){
				found = true;
				cout <<endl<< "Message:" << sms << " To:";
				printPath(root);
				cout << "mh_" << target << endl;
				count++;
				return;
			}
			if (temp->next){
				temp = temp->next;
			}
			else{
				break;
			}

		}
	}
	msgDeliver(target, sms, root->child);
	msgDeliver(target, sms, root->next);
	return;
}


void printPath(BS *root){//when found the host printing the path since we have to go back to base station
	int save[max];		// it's necessary to reverse the path numbers
	int i = 1;
	while (root){
		save[i] = root->id;
		root = root->parent;
		i++;
	}
	while (i > 1){
		i--;
		cout << save[i] << " ";
	}
}

