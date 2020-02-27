/*****************************************************************************
* smallCancellation.cpp		 SmallCancellation	Iván Sadofschi Costa		*
*							   Package			(c) 2018					*
*****************************************************************************/

#include <iostream>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <map>
#include <set>
#include <string>

using namespace std;

#define forn(i,n) for(int i =0 ; i < (int)(n);i++)
#define forsn(i,s,n) for(int i =(int)(s);i<(int)(n);i++)
#define dforn(i,n) for(int i = ((int)(n)-1); i >= 0; i--)
#define element(x,c) ((c).find(x) != (c).end())
#define forall(i,c) for(typeof((c).begin()) i = (c).begin();i != (c).end();i++)

typedef vector<int> word; //  a word in letter representation (as given by LetterRepAssocWord)

struct Trie
{
	Trie() {node=false; piece=false; relation=false;}
	bool node;
	bool piece; // true iff it is a piece
	bool relation; //true iff it is a relation
	//int length;
	map<int, Trie> children;

	void insert_relation(word &w, int pos=0){
		if(node){
			piece=true;
			//longest_piece = max(longest_piece,length);
		}else{
			node=true;
			//length = pos;
		}
		if( pos != w.size() ){
			int x=w[pos];
			children[x].insert_relation(w, pos+1);
		}else{
			relation=true;
		}
	}

	/* bool find(word &w, int pos=0){
		if( pos==w.size() )
			return true;
		int x=w[pos];
		if( element( x, children) )
			return children[x].find(w, pos+1 );
		return false;
	}*/
	bool is_piece(word &w, int pos=0){
		if( pos==w.size() )
			return piece;
		int x=w[pos];
		if( element( x, children) )
			return children[x].is_piece(w, pos+1 );
		return false;
	}
	bool is_relation(word &w, int pos=0){
		if( pos==w.size() )
			return relation;
		int x=w[pos];
		if( element( x, children) )
			return children[x].is_relation(w, pos+1 );
		return false;
	}	
	int max_piece(word &w, int pos=0){
		// length of the largest prefix of w' that is a piece
		// where w' is the subword of w that starts at pos
		if( pos==w.size() )
			return 0;
		int x=w[pos];
		if( element( x, children) && children[x].piece )
			return 1+children[x].max_piece( w, pos+1 );
		return 0;
	}

};

// global variables!
Trie trie_of_pieces; // main structure storing relations and pieces
vector<word> pieces; // set of pieces
int longest_piece=-1; // length of the longest piece
int num_pieces; // number of pieces


void dfs_pieces(Trie &T, word &w){
	// if we are here then w is a piece that goes from the root of the trie to T.
	if( w.size()>0 ){
		pieces.push_back(w);
	}
	forall(it,T.children){
		int x = it->first;
		Trie T1= it->second;
		if(T1.piece ){
			w.push_back(x);
			dfs_pieces(T1,w);
			w.pop_back();
		}
	}
}

bool is_product_of_at_most_k_pieces(word &w, int k, int pos=0){
	// returns true iff the subword of w starting from pos is a product of at most k pieces
	if ( w.size() == pos && k>= 0 ){
		return true;
	}
	if (k<=0){
		return false;
	}
	//if( w.size()-pos > longest_piece * k ){return false;}// pruning
	//we always use the longest possible piece (greedy)
	int m = trie_of_pieces.max_piece(w,pos);
	return is_product_of_at_most_k_pieces(w, k-1, pos+m);
}


//  more globals!
int n_gen,n_rel;
vector< word > rels;
set< word > rels_sym; // we do not want repeated words!

void read_presentation(char* filename){
	freopen(filename,"r", stdin);
	scanf("%d", &n_gen);
	scanf("%d", &n_rel);
	forn(i,n_rel){
		int len,x;
		word r;
		scanf("%d",&len);
		forn(j,len){
			scanf("%d",&x);
			r.push_back(x);
		}
		rels.push_back(r);
	}
}

word inverse_word(word w){
	word w_inv;
	int l=w.size();
	dforn(i,l){
		w_inv.push_back(-w[i]);	
	}
	return w_inv;
}

void generate_symmetrized_relation_set(){
	rels_sym.clear();
	vector<word> rels_and_inverses;
	forn(i,n_rel){
		rels_and_inverses.push_back(rels[i]);
		rels_and_inverses.push_back(inverse_word(rels[i]));
	}
	forn(i,2*n_rel){
		word w=rels_and_inverses[i];
		int l=w.size();
		forn(i,l){
			word w1;
			forsn(j,i,i+l){
				w1.push_back(w[j%l]);
			}
			rels_sym.insert(w1);
		}
	}
}

bool PresentationSatisfiesConditionC(int p){
	forall(it,rels_sym){
		word w=*it;
		if ( is_product_of_at_most_k_pieces(w, p-1) ){
			return false;
		}
	}
	return true;
}

bool PresentationSatisfiesConditionCPrime(float lambda){
	forall(it,rels_sym){
		word w=*it;
		int l=w.size();
		int l1=trie_of_pieces.max_piece(w);
		if (not (l1 < lambda * l)){
			return false;
		}
	}
	return true;
}

bool PresentationSatisfiesConditionCPrimeRationalLambda(int numerator, int denominator){
	forall(it,rels_sym){
		word w=*it;
		int l=w.size();
		int l1=trie_of_pieces.max_piece(w);
		if (not (denominator * l1 < numerator * l)){
			return false;
		}
	}
	return true;
}

void print_word(word w){
	int l=w.size();
	printf("%d\n",l);
	forn(j,l){
		if(j<l-1){
			printf("%d ",w[j]);
		}else{
			printf("%d\n",w[j]);
		}
	}
}

void print_rels_sym(){
	int num_rels_sym=rels_sym.size();
	printf("%d\n\n", num_rels_sym);
	forall(it, rels_sym){
			print_word(*it);
	}
}

void print_pieces(){
	printf("%d\n\n", num_pieces);
	forn(i,num_pieces){
			print_word(pieces[i]);
	}
}

void print_C(int p){
	printf("%d\n",PresentationSatisfiesConditionC(p));
}

void print_CPrime(float lambda){
	printf("%d\n",PresentationSatisfiesConditionCPrime(lambda));
}

void print_CPrimeRationalLambda(int numerator, int denominator){
	printf("%d\n",PresentationSatisfiesConditionCPrimeRationalLambda(numerator,denominator));
}

int main(int argc, char *argv[]){
	// example usage: smallcancellation presentation.in CPrime 0.16666
	char* filename=argv[1];
	string function=argv[2];
	read_presentation(filename); // we read P

	// we assume that the given presentation has cyclically reduced relators!

	generate_symmetrized_relation_set(); //we compute R*

	if( function == "SymmetrizedRelationSet" ){
		print_rels_sym();
		return 0;
	}

	// we insert the relations into the trie 
	forall(it,rels_sym){
		word w = *it;
		trie_of_pieces.insert_relation(w);
	}


	if( function == "Pieces" ){
		// we compute the set of pieces
		word empty_word;
		dfs_pieces(trie_of_pieces,empty_word);
		num_pieces=pieces.size();
		//forn(i,num_pieces){
		//	longest_piece = max(longest_piece, (int) (pieces[i]).size() );
		//}
		// now pieces is the set of pieces
		print_pieces();
		return 0;
	}

	if ( function == "C" ){
		int p=atoi(argv[3]);
		print_C(p);
		return 0;
	}
	if ( function == "CPrime" ){
		float lambda=atof(argv[3]);
		print_CPrime(lambda);
		return 0;
	}
	if ( function == "CPrimeRationalLambda" ){
		int numerator=atof(argv[3]);
		int denominator=atof(argv[4]);
		print_CPrimeRationalLambda(numerator,denominator);
		return 0;
	}
	return 0;
}

